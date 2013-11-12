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

require 'getoptlong'

BF_APP = 'Brainfuck'
BF_VERSION = '0.0.1'
BF_COPYRIGHT = 'Copyright 2009 YelloSoft'
BF_WELCOME = 'Use \'exit\' or Control-C to quit.\n\n'
BF_INTERACTIVE_EXIT = 'exit'

#
# Brainfuck VM
#
class VM
  attr_accessor :COMMENT, :tape, :address, :code, :pos, :step, :debug

  COMMENT = '#'

  def initialize
    @tape = [0] # Dynamic
    @address = 0
    @code = ''
    @pos = 0
    @step = 0

    @debug = false
  end

  def self.valid?(level)
    level.count('[') == level.count(']')
  end

  # Assumes level is valid code.
  def self.sublevel(level)
    i = 1

    slevel = level[0, i]

    until valid?(slevel)
      i += 1
      slevel = level[0, i]
    end

    slevel[1, slevel.length - 2]
  end

  def run(level, position = 0)
    len = level.length

    while position < len
      @step += 1

      puts self if @debug

      c = level[position, 1]

      case c
      when '+'
        @tape[@address] += 1
      when '-'
        @tape[@address] -= 1
      when '<'
        @address -= 1
      when '>'
        @address += 1

        @tape << 0 if @address == @tape.length
      when '.'
        STDOUT.putc(@tape[@address].chr)
      when ','
        @tape[@address] = STDIN.readchar
      when '['
        slevel = VM.sublevel(level[position, len - position])

        run(slevel) until @tape[@address] == 0

        position += slevel.length + 1
      end

      position += 1
    end

    position
  end

  def evalbf(command)
    result = ''

    command.split('\n').each do |cmd|
      if cmd[0, 1] != COMMENT
        @code += cmd

        if VM.valid?(@code)
          @pos = run(@code, @pos)

          result = @tape[@address].to_s
        end
      end
    end

    result
  end

  def interactive
    welcome

    loop do
      line = gets

      break if line == BF_INTERACTIVE_EXIT

      result = evalbf(line.chomp)

      puts result if result != ''
    end
  end

  def scripted(script)
    lines = ''

    begin
      f = open(script, 'r')

      lines = f.read

      f.close
    rescue
      raise "Error reading file #{script}"
    end

    evalbf(lines)
  end

  def to_s
    "--- Step #{@step} ---
Code:\n#{@code}
Position: #{@pos}
Command: #{@code[@pos, 1]}
Tape: #{ @tape.map { |e| e.to_s }.join(" ") }
Address: #{@address}
Value: #{@tape[@address]}"
  end
end

def version
  puts "#{BF_APP} #{BF_VERSION}"
  exit
end

def welcome
  puts "#{BF_APP} #{BF_VERSION} #{BF_COPYRIGHT}\n#{BF_WELCOME}"
end

def usage
  system("more #{$PROGRAM_NAME}")
  exit
end

def main
  mode = :scripted

  vm = VM.new

  opts = GetoptLong.new(
    ['--debug', '-d', GetoptLong::NO_ARGUMENT],
    ['--help', '-h', GetoptLong::NO_ARGUMENT],
    ['--version', '-v', GetoptLong::NO_ARGUMENT]
  )

  opts.each do |option, value|
    case option
    when '--debug'
      vm.debug = true
    when '--help'
      usgae
    when '--version'
      version
    end
  end

  mode = :interactive if ARGV.length < 1

  case mode
  when :interactive
    vm.interactive
  when :scripted
    vm.scripted(ARGV[0])
  end
end

if $PROGRAM_NAME == __FILE__
  begin
    main
  rescue Interrupt
    nil
  rescue RuntimeError => e
    puts e.message
  end
end
