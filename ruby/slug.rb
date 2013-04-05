#!/usr/bin/env ruby

# Author:: Andrew Pennebaker (andrew.pennebaker@gmail.com)
#
# KOPIMI
#
# == Usage
#
# slug <command>

parser = "http://slug.yellosoft.us/?e="

command = ARGV.join "+"

system "open #{parser}#{command}"
