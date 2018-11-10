#!/usr/bin/env ruby

def main
    c = STDIN.getc

    while not c.nil?
        putc c
        c = STDIN.getc
    end
end

if $PROGRAM_NAME == __FILE__
    begin
        main
    rescue Interrupt
        nil
    end
end
