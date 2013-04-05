#!/usr/bin/env ruby

# Andrew Pennebaker
# Copyright 2009 YelloSoft

require "open-uri"

def must_blocking_or_offline?
  begin
    f = open "http://icanhazip.com/"
    data = f.read
    f.close

    octets = data.split(".")

    raise unless octets.length == 4
  rescue
    true
  else
    false
  end
end

def main
  if must_blocking_or_offline?
    puts "-OFFLINE"
  else
    puts "+ONLINE"
  end
end

main if __FILE__ == $0
