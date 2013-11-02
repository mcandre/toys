#!/usr/bin/env ruby

# Author:: Andrew Pennebaker
# Copyright:: Copyright 2007-2008 Andrew Pennebaker
#
# == Synopsis
#
# jaiku.rb: updates and views Jaiku status messages
#
# == Usage
#
# jaiku [OPTIONS] <status>
#
# status must not be more than 140 characters
#
# --help, -h:
#    show help
#
# --debug, -d:
#    enable debugging
#
# --user, -u <user>
#
# --view, -v:
#    view mode
#
# --post, -p:
#    post mode (default)
#
# --list-commands, -l:
#    command mode

require "getoptlong"
require "rdoc/usage"

require "net/http"

require "rubygems"

# prefer faster json parser
begin
  require "json/ext"
rescue LoadError => e
  require "json"
end

require "highline/import"

$MAX_STATUS_LENGTH = 140

def self.load_settings(stream)
  settings = {}

  YAML::load(stream).each { |description, command|
    settings[description] = command
  }

  settings
end

def update(settings)
  debug = settings["debug"]
  domain = settings["post_domain"]
  api = settings["post_api"]
  status = settings["status"]
  username = settings["username"]
  password = settings["password"]
  key = settings["key"]

  raise "Status too long, shorten to #{$MAX_STATUS_LENGTH} characters" unless status.length <= $MAX_STATUS_LENGTH

  Net::HTTP.start(domain) { |http|
    request=Net::HTTP::Post.new(api)
    request.basic_auth(username, password)
    request.set_form_data({ "user" => username, "personal_key" => key, "method" => "presence.send", "message" => status })

    response = http.request(request)

    p response if debug

    message = response.message

    raise "Could not authenticate as #{username}" if message["Unauthorized"]
    raise "Could not connect" if message["Not Acceptable"]
  }
end

def view(settings)
  debug = settings["debug"]
  domain = settings["view_domain"]
  api = settings["view_api"]
  username = settings["username"]

  timeline = nil
  response = nil

  Net::HTTP.start(username + domain) { |http|
    response = http.get(api)

    p response if debug

    raise "Could not connect" if response.message["Not Acceptable"]

    timeline = response.body
  }

  stream = JSON.parse(timeline)["stream"]

  raise "No posts yet" if stream.length == 0

  status = stream[0]["title"]

  status
end

def main()
  mode = :post
  settings = {
    "debug" => false,
    "post_domain" => "api.jaiku.com",
    "post_api" => "/json",
    "view_domain" => ".jaiku.com",
    "view_api" => "/feed/json",
    "username" => "mcandre",
    "key" => 0
  }

  begin
    open("#{File.dirname($0)}/jaiku.yaml") { |file|
      settings = load_settings(file)
    }
  rescue Errno::ENOENT => e
    raise "Could not open settings file"
  end

  opts = GetoptLong.new(
    ["--help", "-h", GetoptLong::NO_ARGUMENT],
    ["--debug", "-d", GetoptLong::NO_ARGUMENT],
    ["--user", "-u", GetoptLong::REQUIRED_ARGUMENT],
    ["--view", "-v", GetoptLong::NO_ARGUMENT],
    ["--post", "-p", GetoptLong::NO_ARGUMENT],
    ["--list-commands", "-y", GetoptLong::NO_ARGUMENT]
  )

  begin
    opts.each { |option, value|
      case option
      when "--help"
        raise
      when "--debug"
        settings["debug"] = true
      when "--user"
        settings["username"] = value
      when "--view"
        mode = :view
      when "--post"
        mode = :post
      end
    }
  rescue
    RDoc::usage("Usage")
  end

  case mode
  when :view
    puts view(settings)
  when :post
    if ARGV.length < 1
      RDoc::usage("Usage")
    else
      settings["password"] = ask("Password: ") { |q| q.echo = false }
      settings["status"] = ARGV.join " "

      update(settings)
    end
  end
end

if __FILE__ == $0
  begin
    main
  rescue Timeout::Error, SocketError => e
    puts "Could not connect"
  rescue Interrupt => e
    nil
  end
end
