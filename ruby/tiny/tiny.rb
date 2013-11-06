#!/usr/bin/env ruby

# Author:: Andrew Pennebaker
# Copyright:: Copyright 2007 Andrew Pennebaker
# == Credits
# http://lateral.netmanagers.com.ar/weblog/2007/04/08.html#BB548
#
# == Synopsis
# tiny - Shortens long URLs, with a variety of services, or a custom service.
#
# == Usage
#
# tiny.rb [OPTIONS] <url1> <url2> <url3> ...
#
# --help, -h:
#    get help with usage
#
# --debug, -d:
#    enable debugging
#
# --list-services, -y:
#    list services in tiny.yaml
#
# --service, -s <service>:
#    select a url shortener service
#
# --custom, -c <service-api>:
#    use a custom service api in the form http://somewebsite.com/api?url=

require "getoptlong"
require "open-uri"
require "contracts"
include Contracts

$DEBUG = false

class Tiny
  attr_reader :name, :short, :domain, :api

  Contract File => Hash
  def self.load_services(stream)
    require "yaml"

    services = {}

    YAML::load(stream).each { |name, specs|
      short = specs["short"]
      domain = specs["domain"]
      api = specs["api"]

      services[short] = Tiny.new(name, short, domain, api)
    }

    services
  end

  Contract String, String, String, String => String
  def initialize(name, short, domain, api)
    @name = name
    @short = short
    @domain = domain
    @api = api
  end

  Contract Hash => ArrayOf[Tiny]
  def self.sort(services)
    services.to_a.collect { |e| e[1] }.sort_by { |e| e.short }
  end

  Contract String => String
  def tiny(url)
    tinyurl = ""

    begin
      open("http://#{@domain}#{@api}#{url}") { |f|
        # elfURL is especially slow

        tinyurl = f.readlines.join ""

        p tinyurl if $DEBUG
      }

      if tinyurl == ""
        url
      else
        # Clean the new URL

        if not tinyurl["http://"]
          # Corp.se links omit the domain
          tinyurl = "http://#{@domain}/#{tinyurl}"
        end

        if tinyurl["OK: "]
          # FON Get Simple prepends a status message
          tinyurl = tinyurl[4, tinyurl.length]
        end

        tinyurl
      end
    rescue
      raise "Could not connect to #{@domain}"
    end
  end
end

Contract nil => nil
def usage
  system("more #{$0}")
  exit
end

def main
  services = {}

  begin
    open("#{File.dirname($0)}/tiny.yaml") { |file|
      services = Tiny::load_services(file)
    }
  rescue Errno::ENOENT => e
    raise "Could not open services file"
  end

  mode = :shorten

  service = Tiny::sort(services)[0]

  opts = GetoptLong.new(
    ["--help", "-h", GetoptLong::NO_ARGUMENT],
    ["--debug", "-d", GetoptLong::NO_ARGUMENT],
    ["--list-services", "-y", GetoptLong::NO_ARGUMENT],
    ["--service", "-s", GetoptLong::REQUIRED_ARGUMENT],
    ["--custom", "-c", GetoptLong::REQUIRED_ARGUMENT]
  )

  begin
    opts.each { |option, value|
      case option
      when "--help"
        raise
      when "--debug"
        $DEBUG = true
      when "--list-services"
        mode = :list_services
      when "--service"
        raise if not services[value]

        service=services[value]
      when "--custom"
        protocol, url = value.split("//")
        parts = url.split("/")
        domain = parts[0]
        api = "/" + parts[1, parts.length - 1].join("/")

        service = Tiny.new("Custom", "cust", domain, api)
      end
    }
  rescue
    usage
  end

  if mode == :shorten
    usage unless ARGV.length > 0

    ARGV.each { |url|
      begin
        puts service.tiny(url)
      rescue RuntimeError => e
        puts e.message
      end
    }
  elsif mode == :list_services
    Tiny::sort(services).each { |e|
      puts "#{e.name} (#{e.short})"
    }
  end
end

if __FILE__ == $0
  begin
    main
  rescue Interrupt => e
    nil
  end
end
