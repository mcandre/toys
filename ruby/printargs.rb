#!/usr/bin/env ruby

def printargs(params)
  params[:dog] = 'fuzzydog' unless params[:dog]

  params.each do |key, value|
    puts "#{key} => #{value}"
  end
end

def main
  printargs(cat: 'fuzzycat')
end

main if $PROGRAM_NAME == __FILE__
