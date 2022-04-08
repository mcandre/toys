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

require 'getoptlong'

def self.create_rule_26(start, n)
    rule = {}

    (start .. (start + 26)).each do |b|
        rule[b] = (b + n - start) % 26 + start
    end

    rule
end

def create_rule(n = 13)
    create_rule_26('a'.ord, n).merge(create_rule_26('A'.ord, n))
end

def self.crypt(rule, b)
    if rule.include?(b)
        rule[b]
    else
        b
    end
end

def main
    shift = 13

    begin
        opts = GetoptLong.new(
            ['--help', '-h', GetoptLong::NO_ARGUMENT],
            ['--shift', '-s', GetoptLong::REQUIRED_ARGUMENT]
        )

        opts.each do |option, value|
            case option
            when '--help'
                usage
            when '--shift'
                shift = value.to_i
            else
                usage
            end
        end
    rescue
        system "less #{$PROGRAM_NAME}"
    end

    rule = create_rule(shift)

    STDIN.each_byte do |b|
        putc crypt(rule, b)
    end
end

if $PROGRAM_NAME == __FILE__
    begin
        main
    rescue Interrupt
        nil
    end
end
