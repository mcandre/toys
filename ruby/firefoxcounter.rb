#!/usr/bin/env ruby

# Author:: Andrew Pennebaker (andrew.pennebaker@gmail.com)
# Copyright:: Copyright 2008 Andrew Pennebaker

require "open-uri"
require "rubygems"
require "hpricot"

def get_counter
	begin
		f=open("http://feeds.spreadfirefox.com/downloads/firefox.xml")
		data=f.read
		f.close

		h=Hpricot(data)
		counter=(h/"rss"/"channel"/"item"/"description").inner_html

		return counter.to_i
	rescue Timeout::Error=>e
		return 0
	rescue
		return 0
	end
end

def main
	puts get_counter
end

if __FILE__==$0
	begin
		main
	rescue RuntimeError => e
		puts e
	rescue Interrupt => e
		nil
	end
end