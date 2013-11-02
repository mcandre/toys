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

def self.create_rule_26(start, n)
  rule = {}

  (start .. (start + 26)).each { |b|
    rule[b] = (b + n - start) % 26 + start
  }

  rule
end

def create_rule(n = 13)
  create_rule_26("a".ord, n).merge(create_rule_26("A".ord, n))
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
    opts=GetoptLong.new(
      ["--help", "-h", GetoptLong::NO_ARGUMENT],
      ["--shift", "-s", GetoptLong::REQUIRED_ARGUMENT]
    )

    opts.each { |option, value|
      case option
      when "--help"
        raise
      when "--shift"
        shift = value.to_i
      end
    }
  rescue
    system "less #{$0}"
  end

  rule = create_rule(shift)

  STDIN.each_byte { |b|
    putc crypt(rule, b)
  }
end

if __FILE__ == $0
  begin
    main
  rescue Interrupt => e
    nil
  end
end
