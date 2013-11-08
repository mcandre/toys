#!/usr/bin/env ruby

# JAT: The Joy of ASCII Art
# http://codegolf.com/bob-ross-the-joy-of-ascii-art

def get_input
  line = ''

  yield line.chomp until !line || line == ''
end

def self.mark(rows, x, y, c)
  space = ' '

  0.upto(y - rows.length) do |i|
    rows.push([])
  end

  0.upto(x - rows[y].length) do |i|
    rows[y].push(space)
  end

  rows[y][x] = c
end

def print_pic(rows)
  rows.each do |row|
    puts row.join('')
  end
end

def main
  rows = []

  get_input do |line|
    parts = line.split(' ')

    x, y, c = parts[0].to_i, parts[1].to_i, parts[2].to_i.chr

    mark(rows, x, y, c)
  end

  print_pic(rows)
end

if $PROGRAM_NAME == __FILE__
  begin
    main
  rescue Interrupt
    nil
  end
end
