#!/usr/bin/env ruby

# Andrew Pennebaker
# Copyright 2007 Andrew Pennebaker
#
# Credits: http://www.krugle.com/files/cvs/cvs.jabberstudio.org/neutron/plugins/time_plugin.py

require "time"

class Time
	def beats
		t=self.gmtime

		seconds=t.hour*3600+t.min*60+t.sec

		seconds+=3600 # UTC to Biel Mean Time

		return (seconds/86.4) % 1000
	end

	def self.beats
		Time.now.beats
	end

	def swatchtime
		return format("@%06.2f", beats)
	end

	def self.swatchtime
		Time.now.swatchtime
	end

	def internettime
		return swatchtime
	end

	def self.internettime
		self.swatchtime
	end
end

def main
	puts Time.swatchtime
end

if __FILE__==$0
	main
end
