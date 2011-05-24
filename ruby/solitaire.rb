#!/usr/bin/env ruby

# Author:: Andrew Pennebaker
# Copyright:: Copyright 2007 Andrew Pennebaker
#
# == Synopsis
#
# solitaire - encrypts/decrypts text messages with the Solitaire algorithm
#
# == Usage
#
# solitaire.rb [OPTIONS] <infile>
#
# --help, -h:
#    usage help
#
# --encrypt, -e:
#    encryption mode (default)
#
# --decrypt, -d:
#    decryption mode
#
# --key, -k <key>

require "enumerator"

class Card
	attr_reader :suit, :face

	SUITS=[:clubs, :diamonds, :hearts, :spades]
	BASE_VALUES=[0, 13, 26, 39]
	FACES=[:ace, :two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king]

	def initialize(suit, face)
		@suit=suit
		@face=face
	end

	def self.suits
		return SUITS
	end

	def self.faces
		return FACES
	end

	def face_value()
		return FACES.index(@face)+1
	end

	def base_value()
		return BASE_VALUES[SUITS.index(@suit)]
	end

	def value()
		if @suit==:joker
			return 53
		else
			return base_value()+face_value()
		end
	end

	def to_s()
		if @suit==:joker
			return "#{@face} joker [#{value()}]"
		else
			return "#{@face} of #{@suit} [#{value()}]"
		end
	end
end

$deck=[]
Card.suits.each { |suit|
	Card.faces.each { |face|
		$deck.push(Card.new(suit, face))
	}
}
$deck.push(Card.new(:joker, :a))
$deck.push(Card.new(:joker, :b))

$deck.each { |card|
	puts card
}

def encrypt(message)
	# message=(message+("X"*5)).upcase.scan(/.{5}/)
	message=(message+("X"*5)).upcase.gsub(/[^A-Z]/, "")

	p message

	plainbytes=Enumerable::Enumerator.new(message, :each_byte).collect {|n| n-"A"[0]+1}

	p plainbytes
end

def decrypt(message, key)
end

encrypt "Boy howdy!\nI do declare."