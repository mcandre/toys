#!/usr/bin/env ruby

99.downto(3) { |i|
	puts "#{i} bottles of beer on the wall, #{i} bottles of beer.\nTake one down, pass it around, #{i-1} bottles of beer on the wall.\n\n"
}

puts "2 bottles of beer on the wall, 2 bottle of beer.\nTake one down, pass it around, 1 bottle of beer on the wall.\n\n"

puts "1 bottle of beer on the wall, 1 bottle of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall."