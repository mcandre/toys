#!/usr/bin/env ruby

# Based on Jeffrey Winter's code (http://www.xefer.com/script/automaton.js)
#
# Author:: Andrew Pennebaker
# == Synopsis
#
# Automata: Stephen Wolfram's cellular automata
#
# == Usage
#
# automata [rule]
#
# Rule defaults to 110.

require "rdoc/usage"
require "getoptlong"

MARKER="#"
SPACE=" "

class Automata
	attr_accessor :rule, :memory

	def initialize(rule, memory, random=false)
		@rule=rule
		@memory=memory

		if random
			@record=0.upto(memory-1).collect { |i|
				rand>0.5
			}
		else
			@record=[false]*memory
			@record[memory/2]=true
		end
	end

	def step
		m = @memory - 1

		@record=0.upto(m).collect { |i|
			left=i-1;
			left=m if left<0

			right=i+1;
			right=0 if right==@memory

			state=0

			state |= 0x04 if @record[left]
			state |= 0x02 if @record[i]
			state |= 0x01 if @record[right]

			((rule >> state) & 0x01) == 1
		}
	end

	def to_s
		@record.collect { |b| b ? MARKER : SPACE }.join("")
	end
end

def main
	rule=110
	width=80
	iterations=100
	random=false

	opts=GetoptLong.new(
		["--help", "-h", GetoptLong::NO_ARGUMENT],
		["--width", "-w", GetoptLong::REQUIRED_ARGUMENT],
		["--iter", "-i", GetoptLong::REQUIRED_ARGUMENT],
		["--rand", "-r", GetoptLong::NO_ARGUMENT]
	)

	begin
		opts.each { |option, value|
			case option
			when "--help"
				RDoc::usage("Usage")
			when "--width"
				width=value.to_i
			when "--iter"
				iterations=value.to_i
			when "--rand"
				random=true
			end
		}
	rescue
		RDoc::usage("Usage")
	end

	a = ARGV.length

	if a == 1
		rule=ARGV[0].to_i
	elsif a > 1
		RDoc::usage("Usage")
	end

	a = Automata.new(rule, width, random)

	0.upto(iterations-1) { |i|
		puts a
		a.step
	}
end

if __FILE__==$0
	main
end
