#!/usr/bin/env ruby

# Author:: Andrew Pennebaker (andrew.pennebaker@gmail.com)
# Copyright:: Copyright 2007-2008 Andrew Pennebaker
#
# == Usage
#
# rot13 [OPTIONS]
#
# Data is read from STDIN and written to STDOUT.
#
# --help, -h:
#    Help with usage
#
# --shift, -s:
#    Set Caesar shift (default 13).

require "getoptlong"
require "rdoc/usage"

def create_rule(n=13)
	rule={}

	# "A"[0].upto("Z"[0])
	65.upto(90) { |b|
		rule[b]=(b+n-65)%26+65
	}

	# "a"[0].upto("z"[0])
	97.upto(122) { |b|
		rule[b]=(b+n-97)%26+97
	}

	return rule
end

def crypt(rule, b)
	if rule.include?(b)
		return rule[b]
	else
		return b
	end
end

def main
	shift=13

	begin
		opts=GetoptLong.new(
			["--help", "-h", GetoptLong::NO_ARGUMENT],
			["--shift", "-s", GetoptLong::REQUIRED_ARGUMENT]
		)

		opts.each { |option, value|
			case option
			when "--help"
				raise
			when "--shift"
				shift=value.to_i
			end
		}
	rescue
		RDoc::usage("Usage")
	end

	rule=create_rule(shift)

	STDIN.each_byte { |b|
		putc crypt(rule, b)
	}
end

if __FILE__==$0
	begin
		main
	rescue Interrupt=>e
		nil
	end
end