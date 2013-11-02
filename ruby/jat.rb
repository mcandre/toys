#!/usr/bin/env ruby

# JAT: The Joy of ASCII Art
# http://codegolf.com/bob-ross-the-joy-of-ascii-art

def get_input
  while true
    line=gets
    if not line or line == ""
      break
    else
      yield line.chomp
    end
  end
end

def self.mark(rows, x, y, c)
  space=" "

  0.upto(y-rows.length) { |i|
    rows.push([])
  }

  0.upto(x-rows[y].length) { |i|
    rows[y].push(space)
  }

  rows[y][x]=c
end

def print_pic(rows)
  rows.each { |row|
    puts row.join("")
  }
end

def main
  rows=[]

  get_input { |line|
    parts=line.split(" ")

    x, y, c=parts[0].to_i, parts[1].to_i, parts[2].to_i.chr

    mark(rows, x, y, c)
  }

  print_pic(rows)
end

if __FILE__==$0
  begin
    main
  rescue Interrupt => e:
    nil
  end
end
