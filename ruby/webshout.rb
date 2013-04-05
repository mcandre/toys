#!/usr/bin/env ruby

require "open-uri"

data = ""

while data == ""
  begin
    data = open("http://www.google.com/").read
  rescue
    nil
  end
end

# Requires Mac OS X
exec "say You are now online."
