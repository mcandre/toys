#!/usr/bin/env ruby

# Author:: Andrew Pennebaker
# Copyright:: Copyright 2007 Andrew Pennebaker
#
# == Credits
#
# Twitter API
# http://muffinresearch.co.uk/archives/2007/03/24/tweetypy-python-based-cli-client-for-twitter/
#
# == Synopsis
#
# tw.rb: updates and views Twitter status messages
#
# == Usage
#
# tw [OPTIONS] <status>
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

require "pp"

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

$MAX_STATUS_LENGTH=140

def load_commands(stream)
	commands={}

	YAML::load(stream).each { |description, command|
		commands[description]=command
	}

	return commands
end

def update(settings)
	debug=settings[:debug]
	domain=settings[:domain]
	api=settings[:post_api]
	status=settings[:status]
	username=settings[:username]
	password=settings[:password]

	begin
		Net::HTTP.start(domain) { |http|
			request=Net::HTTP::Post.new(api)
			request.basic_auth(username, password)
			request.set_form_data({"status" => status})

			response=http.request(request)

			if debug
				pp response
			end

			raise "Could not connect" unless response.message["OK"]
		}
	rescue Timeout::Error=>e
		raise "Could not connect"
	rescue Errno::ECONNRESET=>e
		raise "Could not connect"
	end
end

def view(settings)
	debug=settings[:debug]
	domain=settings[:domain]
	username=settings[:username]

	timeline=nil
	response=nil

	begin
		Net::HTTP.start(domain) { |http|
			response=http.get("/statuses/user_timeline/"+username+".json?count=1")

			if debug
				pp response
			end

			raise "Could not connect" unless response.message["OK"]

			timeline=response.body
		}

		status=JSON.parse(timeline)[0]["text"]
	rescue Timeout::Error=>e
		status="Could not connect"
	rescue JSON::ParserError => e
		status="JSON Parse Error"
	end

	return status
end

def main()
	mode = :post
	settings = {
		:debug => false,
		:domain => "twitter.com",
		:post_api => "/statuses/update.json",
		:username => "mcandre"
	}

	opts=GetoptLong.new(
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
				settings[:debug]=true
			when "--user"
				settings[:username]=value
			when "--view"
				mode = :view
			when "--post"
				mode = :post
			when "--list-commands"
				mode = :listcommands
			end
		}
	rescue
		RDoc::usage("Usage")
	end

	case mode
	when :view
		puts view(settings)
	when :post
		if ARGV.length<1
			RDoc::usage("Usage")
		else
			settings[:status]=ARGV.join " "
			raise "Status too long, shorten to #{$MAX_STATUS_LENGTH} characters" unless settings[:status].length<=$MAX_STATUS_LENGTH
			settings[:password]=ask("Password: ") {|q| q.echo=false}

			update(settings)
		end
	when :listcommands
		begin
			open("#{File.dirname($0)}/tw.yaml") { |file|
				load_commands(file).each { |description, command|
					puts "#{description}\n    #{command}\n\n"
				}
			}
		rescue Errno::ENOENT => e
			raise "Could not open commands file"
		end
	end
end

if __FILE__==$0
	begin
		main
	rescue RuntimeError=>e
		puts e.message
	rescue SocketError=>e
		puts "Could not connect"
	rescue Interrupt=>e
		nil
	end
end