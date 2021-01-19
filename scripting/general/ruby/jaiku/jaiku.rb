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
# --user, -u <user>:
#    declare username
#
# --view, -v:
#    view mode
#
# --post, -p:
#    post mode (default)
#
# --list-commands, -l:
#    command mode

require 'json'
require 'getoptlong'
require 'net/http'
require 'highline/import'
require 'contracts'
include Contracts

#
# Jaiku
#
module Jaiku
    MAX_STATUS_LENGTH = 140

    Contract File => Hash
    def self.load_settings(stream)
        settings = {}

        YAML.load(stream).each do |description, command|
            settings[description] = command
        end

        settings
    end

    Contract Hash => String
    def update(settings)
        debug = settings['debug']
        domain = settings['post_domain']
        api = settings['post_api']
        status = settings['status']
        username = settings['username']
        password = settings['password']
        key = settings['key']

        fail "Status too long, shorten to #{MAX_STATUS_LENGTH} characters" unless status.length <= MAX_STATUS_LENGTH

        Net::HTTP.start(domain) do |http|
            request = Net::HTTP::Post.new(api)
            request.basic_auth(username, password)
            request.set_form_data(
                'user' => username,
                'personal_key' => key,
                'method' => 'presence.send',
                'message' => status
            )

            response = http.request(request)

            p response if debug

            message = response.message

            fail "Could not authenticate as #{username}" if message['Unauthorized']
            fail 'Could not connect' if message['Not Acceptable']
        end
    end

    Contract Hash => String
    def view(settings)
        debug = settings['debug']
        domain = settings['view_domain']
        api = settings['view_api']
        username = settings['username']

        timeline = nil
        response = nil

        Net::HTTP.start(username + domain) do |http|
            response = http.get(api)

            p response if debug

            fail 'Could not connect' if response.message['Not Acceptable']

            timeline = response.body
        end

        stream = JSON.parse(timeline)['stream']

        fail 'No posts yet' if stream.length == 0

        status = stream[0]['title']

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
        'debug' => false,
        'post_domain' => 'api.jaiku.com',
        'post_api' => '/json',
        'view_domain' => '.jaiku.com',
        'view_api' => '/feed/json',
        'username' => 'mcandre',
        'key' => 0
    }

    begin
        open("#{File.dirname($PROGRAM_NAME)}/jaiku.yaml") do |file|
            settings = load_settings(file)
        end
    rescue Errno::ENOENT
        raise 'Could not open settings file'
    end

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
                settings['debug'] = true
            when '--user'
                settings['username'] = value
            when '--view'
                mode = :view
            when '--post'
                mode = :post
            else
                usage
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
            settings['password'] = ask('Password: ') { |q| q.echo = false }
            settings['status'] = ARGV.join ' '

            update(settings)
        end
    else
        usage
    end
end

if $PROGRAM_NAME == __FILE__
    begin
        main
    rescue Timeout::Error, SocketError
        puts 'Could not connect'
    rescue Interrupt
        nil
    end
end
