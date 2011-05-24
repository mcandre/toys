#!/usr/bin/env ruby

require "open-uri"

def site_status(domain)
	data=nil

	begin
		data=open("http://www.iwebtool.com/tool/tools/server_status/server_status.php?domain=#{domain}").read
	rescue Timeout::Error=>e
		return "unknown"
	rescue
		return "unknown"
	end

	if not data["The website is accessible!"].nil?
		return "up"
	else
		return "down"
	end
end

def main
	ARGV.each { |arg|
		puts "#{arg}: #{site_status(arg)}"
	}
end

if __FILE__==$0
	begin
		main
	rescue Interrupt => e
		nil
	end
end