#!/usr/bin/env ruby

# Author:: Andrew Pennebaker (andrew.pennebaker@gmail.com)
#
# KOPIMI
#
# Uses the civil sunset API from http://iamlegend.warnerbros.com/iphone/daylightmeter/

require 'pp'
require 'net/http'
require 'rubygems'
require 'json'

require 'contracts'
include Contracts

Contract nil => nil
def usage
  puts 'Usage: sunset <zipcode>'
  exit
end

Contract Hash => Hash
def getinfo(settings)
  debug = settings['debug']
  domain = settings['domain']
  api = settings['api']
  zip = settings['zip']

  Net::HTTP.start(domain) do |http|
    response = http.get(api + zip)

    pp response if debug

    fail 'Could not connect' if response.message['Not Acceptable']

    JSON.parse(response.body)['weather']
  end
end

def main
  settings = {
    'debug' => false,
    'domain' => 'iamlegend.warnerbros.com',
    'api' => '/iphone/sunset.php?zip=',
    'zip' => '22030'
  }

  if ARGV.length != 1
    usage
  else
    settings['zip'] = ARGV[0]
  end

  info = getinfo(settings)

  pp info if settings['debug']

  puts info['formattedSet']
end

if $PROGRAM_NAME == __FILE__
  begin
    main
  rescue Timeout::Error
    puts 'Could not connect'
  end
end
