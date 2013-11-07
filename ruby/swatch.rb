#!/usr/bin/env ruby

# Andrew Pennebaker
# Copyright 2007 Andrew Pennebaker
#
# Credits: http://www.krugle.com/files/cvs/cvs.jabberstudio.org/neutron/plugins/time_plugin.py

require 'time'
require 'contracts'
include Contracts

#
# Swatch Time
#
class Time
  Contract nil => Num
  def beats
    t = gmtime

    seconds = t.hour * 3600 + t.min * 60 + t.sec

    seconds += 3600 # UTC to Biel Mean Time

    (seconds / 86.4) % 1000
  end

  Contract nil => Num
  def self.beats
    Time.now.beats
  end

  Contract nil => String
  def swatchtime
    format('@%06.2f', beats)
  end

  Contract nil => String
  def self.swatchtime
    Time.now.swatchtime
  end

  Contract nil => String
  def self.internettime
    swatchtime
  end
end

def main
  puts Time.swatchtime
end

main if $PROGRAM_NAME == __FILE__
