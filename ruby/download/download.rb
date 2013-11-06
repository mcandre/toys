#!/usr/bin/env ruby

# Author:: Andrew Pennebaker (andrew.pennebaker@gmail.com)
# Copyright:: Copyright 2007 Andrew Pennebaker
#
# == Credits
#
# http://snippets.dzone.com/posts/show/2469
#
# == Usage
#
# download [OPTIONS] <url1> <url2> <url3> ...
#
# --help, -h:
#    get help with usage
#
# --list-user-agents, -y:
#    list user agents from useragents.yaml
#
# --outfile, -o <file>:
#    specify an outputfile (else uses URL suffix)
#    do not use with multiple URLs
#
# --user-agent, -u <string>:
#    specify a user agent. if not in useragents.yaml by name, string is used as the agent.

require "getoptlong"
require "open-uri"

require "contracts"
include Contracts

$DEFAULT_USER_AGENT = "Ruby/#{RUBY_VERSION}"

Contract File => Hash
def load_user_agents(stream)
  require "yaml"

  user_agents = {}

  YAML::load(stream).each { |name, string| user_agents[name] = string }

  user_agents
end

Contract String => String
def self.getfilename(url)
  url.split("/")[-1]
end

Contract String, String, String => String
def download(url, filename = "", user_agent = $DEFAULT_USER_AGENT)
  begin
    open(url, "User-Agent" => user_agent) { |filein|
      if filename.length < 1
        filename = getfilename(url)
      end

      open(filename, "wb") { |fileout|
        filein.each { |line|
          fileout.write(line)
        }
      }
    }
  rescue
    raise "Could not download #{url}"
  end
end

Contract nil => nil
def usage
  system("more #{$0}")
  exit(0)
end

def main
  mode = :download

  outfile = ""
  user_agent = $DEFAULT_USER_AGENT

  user_agents = {}

  begin
    open("#{File.dirname($0)}/useragents.yaml") { |file|
      user_agents = load_user_agents(file)
    }
  rescue Errno::ENOENT => e
    nil
  end

  opts=GetoptLong.new(
    ["--help", "-h", GetoptLong::NO_ARGUMENT],
    ["--list-user-agents", "-y", GetoptLong::NO_ARGUMENT],
    ["--outfile", "-o", GetoptLong::REQUIRED_ARGUMENT],
    ["--user-agent", "-u", GetoptLong::REQUIRED_ARGUMENT]
  )

  begin
    opts.each { |option, value|
      case option
      when "--help"
        raise
      when "--list-user-agents"
        mode = :list_user_agents
      when "--outfile"
        outfile=value
      when "--user-agent"
        value = user_agents[value]

        if value
          user_agent = value
        else
          puts "Warning: agent not found or agents file not loaded"
          user_agent = value
        end
      end
    }
  rescue
    usage
  end

  if mode == :download
    if ARGV.length < 1
      usage
    end

    ARGV.each { |url|
      puts "Downloading #{url}"
      begin
        download(url, outfile, user_agent)
        puts "Done"
      rescue SocketError => e
        puts "Could not connect to #{getdomain(url)}"
      end
    }
  elsif mode == :list_user_agents
    user_agents.each { |name, agent| puts name }
  end
end

if __FILE__ == $0
  begin
    main
  rescue Interrupt => e
    nil
  end
end
