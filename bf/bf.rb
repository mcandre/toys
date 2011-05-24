#!/usr/bin/env ruby

# Author:: Andrew Pennebaker
# Copyright:: Copyright 2009 Andrew Pennebaker
#
# == Synopsis
#
# bf: Brainfuck interpreter
#
# == Usage
#
# bf [options] [script]
#
# --debug, -d:
#    enable debug mode
#
# --help, -h:
#    show help
#
# --version, -v:
#    show version

require "getoptlong"
require "rdoc/usage"

BF_APP="Brainfuck"
BF_VERSION="0.0.1"
BF_COPYRIGHT="Copyright 2009 YelloSoft"
BF_WELCOME="Use \'exit\' or Control-C to quit.\n\n"
BF_INTERACTIVE_EXIT="exit"

class VM
	attr_accessor :COMMENT, :tape, :address, :code, :pos, :step, :debug

	COMMENT="#"

	def initialize
		@tape=[0] # Dynamic
		@address=0
		@code=""
		@pos=0
		@step=0

		@debug=false
	end

	def self.valid?(level)
		return level.count("[")==level.count("]")
	end

	# Assumes level is valid code.
	def self.sublevel(level)
		i=1

		slevel=level[0, i]
		while not valid?(slevel)
			i+=1
			slevel=level[0, i]
		end

		return slevel[1, slevel.length-2]
	end

	def run(level, position=0)
		while (position<level.length)
			@step+=1

			if @debug
				puts self
			end

			c=level[position, 1]

			case c
			when "+"
				@tape[@address]+=1
			when "-"
				@tape[@address]-=1
			when "<"
				@address-=1
			when ">"
				@address+=1
				if @address==@tape.length
					@tape << 0
				end
			when "."
				STDOUT.putc(@tape[@address].chr)
			when ","
				@tape[@address]=STDIN.readchar
			when "["
				slevel=VM.sublevel(level[position, level.length-position])

				while (@tape[@address]!=0)
					run(slevel)
				end

				position+=slevel.length+1
			end

			position+=1
		end

		return position
	end

	def eval(command)
		result=""

		command.split("\n").each do |cmd|
			if (cmd[0, 1]!=COMMENT)
				@code+=cmd

				if VM.valid?(@code)
					@pos=run(@code, @pos)

					result=@tape[@address].to_s
				end
			end
		end

		return result
	end

	def interactive
		welcome

		line=gets
		while line!=BF_INTERACTIVE_EXIT
			result=eval(line.chomp)
			if (result!="")
				puts result
			end

			line=gets
		end
	end

	def scripted(script)
		lines=""

		begin
			f=open(script, "r")

			lines=f.read

			f.close
		rescue
			raise "Error reading file #{script}"
		end

		eval(lines)
	end

	def to_s
		result="--- Step #{@step} ---\n"
		result+="Code:\n#{@code}\n"
		result+="Position: #{@pos}\n"
		result+="Command: #{@code[@pos, 1]}\n"
		result+="Tape: #{ @tape.collect { |e| e.to_s }.join(" ") }\n"
		result+="Address: #{@address}\n"
		result+="Value: #{@tape[@address]}"

		return result
	end
end

def version
	puts "#{BF_APP} #{BF_VERSION}"
	exit
end

def welcome
	puts "#{BF_APP} #{BF_VERSION} #{BF_COPYRIGHT}\n#{BF_WELCOME}"
end

def main
	mode = :scripted

	script=""

	vm=VM.new

	opts=GetoptLong.new(
		["--debug", "-d", GetoptLong::NO_ARGUMENT],
		["--help", "-h", GetoptLong::NO_ARGUMENT],
		["--version", "-v", GetoptLong::NO_ARGUMENT]
	)

	opts.each { |option, value|
		case option
		when "--debug"
			vm.debug=true
		when "--help"
			RDoc::usage("Usage")
		when "--version"
			version
		end
	}

	if ARGV.length<1
		mode = :interactive
	end

	case mode
	when :interactive
		vm.interactive
	when :scripted
		vm.scripted(ARGV[0])
	end
end

if __FILE__==$0
	begin
		main
	rescue Interrupt => e
		nil
	rescue RuntimeError => e
		puts e.message
	end
end