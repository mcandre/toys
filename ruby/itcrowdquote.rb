#!/usr/bin/env ruby

# Author:: Andrew Pennebaker (andrew.pennebaker@gmail.com)
# Copyright:: Copyright 2007-2008 Andrew Pennebaker

require "rubygems"
require "hpricot"

require "open-uri"
require "htmlentities"

coder = HTMLEntities.new

url = "http://www.channel4.com/entertainment/tv/microsites/I/itcrowd/quote_generator/"

doc = nil

begin
  doc = open(url) { |f| Hpricot(f) }
rescue
  raise "Could not access #{url}"
end

section = doc/"blockquote"/"p"
citation = (section/"cite"/"a").inner_html
(section/"cite").remove
quote = section.inner_html

# remove leading whitespace
quote.gsub!(/^\s+/, "")

# remove trailing whitespace
quote.gsub!(/\s+$/, $/)

# remove dash
quote.gsub!(/\s\-\s+$/, $/).chomp

# decode HTML entities
quote = coder.decode(quote)

puts "#{quote} - #{citation}"
