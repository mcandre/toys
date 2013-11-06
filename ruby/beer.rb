#!/usr/bin/env ruby

require "contracts"
include Contracts

Contract Num => String
def beer(i)
  if i >= 3 then
    "#{i} bottles of beer on the wall, #{i} bottles of beer.\nTake one down, pass it around, #{i-1} bottles of beer on the wall.\n\n"
  elsif i > 1 then
    "2 bottles of beer on the wall, 2 bottle of beer.\nTake one down, pass it around, 1 bottle of beer on the wall.\n\n"
  else
    "1 bottle of beer on the wall, 1 bottle of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall."
  end
end

99.downto(1) { |i|
  puts beer(i)
}
