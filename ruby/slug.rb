#!/usr/bin/env ruby

# Author:: Andrew Pennebaker (andrew.pennebaker@gmail.com)
#
# KOPIMI
#
# == Usage
#
# slug <command>

def main
    parser = 'http://slug.yellosoft.us/?e='

    command = ARGV.join '+'

    system "open #{parser}#{command}"
end

main if $PROGRAM_NAME == __FILE__
