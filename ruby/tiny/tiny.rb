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
require "rdoc/usage"

require "open-uri"

class Tiny
	attr_reader :name, :short, :domain, :api

	def self.load_services(stream)
		require "yaml"

		services={}

		YAML::load(stream).each { |name, specs|
			short=specs["short"]
			domain=specs["domain"]
			api=specs["api"]

			services[short]=Tiny.new(name, short, domain, api)
		}

		return services
	end

	def initialize(name, short, domain, api)
		@name=name
		@short=short
		@domain=domain
		@api=api
	end

	def self.sort(services)
		services=services.to_a.collect { |e| e[1] }
		return services.sort_by { |e| e.short }
	end

	def tiny(url, debug=false)
		tinyurl=""

		begin
			open("http://#{@domain}#{@api}#{url}") { |f|
				# elfURL is especially slow

				tinyurl=f.readlines.join ""

				if debug
					p tinyurl
				end
			}

			if tinyurl==""
				return url
			else
				# Clean the new URL

				if not tinyurl["http://"]
					# Corp.se links omit the domain
					tinyurl="http://#{@domain}/#{tinyurl}"
				end

				if tinyurl["OK: "]
					# FON Get Simple prepends a status message
					tinyurl=tinyurl[4, tinyurl.length]
				end

				return tinyurl
			end
		rescue Timeout::Error=>e
			raise "Could not connect to #{@domain}"
		rescue
			raise "Could not connect to #{@domain}"
		end
	end
end

def main
	services={}

	begin
		open(File.dirname($0)+"/"+"tiny.yaml") { |file|
			services=Tiny::load_services(file)
		}
	rescue Errno::ENOENT => e
		raise "Could not open services file"
	end

	mode = :shorten

	service=Tiny::sort(services)[0]

	debug = false

	opts=GetoptLong.new(
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
				debug=true
			when "--list-services"
				mode = :list_services
			when "--service"
				if services[value]==nil
					raise
				else
					service=services[value]
				end
			when "--custom"
				protocol, url=value.split("//")
				parts=url.split("/")
				domain=parts[0]
				api="/"+parts[1, parts.length-1].join("/")

				service=Tiny.new("Custom", "cust", domain, api)
			end
		}
	rescue
		RDoc::usage("Usage")
	end

	if mode == :shorten
		if ARGV.length<1
			raise
		end

		ARGV.each { |url|
			begin
				puts service.tiny(url, debug)
			rescue RuntimeError=>e
				puts e.message
			end
		}
	elsif mode == :list_services
		Tiny::sort(services).each { |e|
			puts "#{e.name} (#{e.short})"
		}
	end
end

if __FILE__==$0
	begin
		main()
	rescue Interrupt=>e
		nil
	end
end