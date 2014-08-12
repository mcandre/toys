#!/usr/bin/env ruby

# from http://www.thinkgeek.com/tshirts/generic/947f/

def main
  data = [
          0x09, 0xf9, 0x11, 0x02,
          0x9d, 0x74, 0xe3, 0x5b,
          0xd8, 0x41, 0x56, 0xc5,
          0x63, 0x56, 0x88, 0xbd
  ]

  0.upto(6) do |i|
    temp = data.dup
    temp[-1] += i
    temp = temp.map { |e| sprintf '%02x', e }

    if i != 3
      puts temp.join(' ')
    else
      puts ' ' * 17 + '[ redacted ]'
    end
  end
end

main if $PROGRAM_NAME == __FILE__
