#!/usr/bin/env ruby

def printargs(params)
  params[:dog] = 'fuzzydog' unless params[:dog]

  params.each do |key, value|
    puts "#{key} => #{value}"
  end
end

printargs(cat: 'fuzzycat')
