#!/usr/bin/env ruby

require "open-uri"

def get_proxies
	url="http://www.steganos.com/?area=updateproxylist"

	proxies=[]

	begin
		open(url) { |f|
			f.each_line { |line|
				proxies << line
			}
		}
	rescue Timeout::Error=>e
		raise "Unable to access #{url}"
	rescue SocketError=>e
		raise "Unable to access #{url}"
	rescue
		raise "Unable to access #{url}"
	end

	return proxies
end

def main
	begin
		proxies=get_proxies

		puts proxies
	rescue
		puts "Could not connect to Steganos"
	rescue RuntimeError=>e
		puts e.message
	end
end

if __FILE__==$0
	begin
		main
	rescue Interrupt=>e
		nil
	end
end