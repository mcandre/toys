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

require 'pp'
require 'json'
require 'getoptlong'
require 'net/http'
require 'highline/import'
require 'contracts'
include Contracts

#
# Twitter
#
module Tw
  MAX_STATUS_LENGTH = 140

  Contract File => Hash
  def self.load_commands(stream)
    commands = {}

    YAML.load(stream).each do |description, command|
      commands[description] = command
    end

    commands
  end

  Contract Hash => String
  def update(settings)
    debug = settings[:debug]
    domain = settings[:domain]
    api = settings[:post_api]
    status = settings[:status]
    username = settings[:username]
    password = settings[:password]

    begin
      Net::HTTP.start(domain) do |http|
        request = Net::HTTP::Post.new(api)
        request.basic_auth(username, password)
        request.set_form_data('status' => status)

        response = http.request(request)

        pp response if debug

        fail unless response.message['OK']
      end
    rescue Timeout::Error, Errno::ECONNRESET
      raise 'Could not connect'
    end
  end

  Contract Hash => String
  def view(settings)
    debug = settings[:debug]
    domain = settings[:domain]
    username = settings[:username]

    timeline = nil
    response = nil

    begin
      Net::HTTP.start(domain) do |http|
        response = http.get("/statuses/user_timeline/#{username}json?count=1")

        pp response if debug

        fail 'Could not connect' unless response.message['OK']

        timeline = response.body
      end

      status = JSON.parse(timeline)[0]['text']
    rescue Timeout::Error
      status = 'Could not connect'
    rescue JSON::ParserError
      status = 'JSON Parse Error'
    end

    status
  end
end

Contract nil => nil
def usage
  system("more #{$PROGRAM_NAME}")
  exit(0)
end

def main
  mode = :post
  settings = {
    debug: false,
    domain: 'twitter.com',
    post_api: '/statuses/update.json',
    username: 'mcandre'
  }

  opts = GetoptLong.new(
    ['--help', '-h', GetoptLong::NO_ARGUMENT],
    ['--debug', '-d', GetoptLong::NO_ARGUMENT],
    ['--user', '-u', GetoptLong::REQUIRED_ARGUMENT],
    ['--view', '-v', GetoptLong::NO_ARGUMENT],
    ['--post', '-p', GetoptLong::NO_ARGUMENT],
    ['--list-commands', '-y', GetoptLong::NO_ARGUMENT]
  )

  begin
    opts.each do |option, value|
      case option
      when '--help'
        usage
      when '--debug'
        settings[:debug] = true
      when '--user'
        settings[:username] = value
      when '--view'
        mode = :view
      when '--post'
        mode = :post
      when '--list-commands'
        mode = :listcommands
      end
    end
  rescue
    usage
  end

  case mode
  when :view
    puts view(settings)
  when :post
    if ARGV.length < 1
      usage
    else
      settings[:status] = ARGV.join ' '

      if settings[:status].length > MAX_STATUS_LENGTH
        fail "Status too long, shorten to #{MAX_STATUS_LENGTH} characters"
      end

      settings[:password] = ask('Password: ') { |q| q.echo = false }

      update(settings)
    end
  when :listcommands
    begin
      open("#{File.dirname($PROGRAM_NAME)}/tw.yaml") do |file|
        load_commands(file).each do |description, command|
          puts "#{description}\n    #{command}\n\n"
        end
      end
    rescue Errno::ENOENT
      raise 'Could not open commands file'
    end
  end
end

if $PROGRAM_NAME == __FILE__
  begin
    main
  rescue SocketError
    puts 'Could not connect'
  rescue Interrupt
    nil
  end
end
