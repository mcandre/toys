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
require "contracts"
include Contracts

class Card
  attr_reader :suit, :face

  SUITS = [:clubs, :diamonds, :hearts, :spades]
  BASE_VALUES = [0, 13, 26, 39]
  FACES = [:ace, :two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king]

  Contract Symbol, Symbol => Symbol
  def initialize(suit, face)
    @suit = suit
    @face = face
  end

  Contract nil => ArrayOf[Symbol]
  def self.suits
    SUITS
  end

  Contract nil => ArrayOf[Symbol]
  def self.faces
    FACES
  end

  Contract nil => Num
  def face_value
    FACES.index(@face) + 1
  end

  Contract nil => Num
  def base_value
    BASE_VALUES[SUITS.index(@suit)]
  end

  Contract nil => Num
  def value
    if @suit == :joker
      53
    else
      base_value + face_value
    end
  end

  Contract nil => String
  def to_s
    if @suit == :joker
      "#{@face} joker [#{value()}]"
    else
      "#{@face} of #{@suit} [#{value()}]"
    end
  end
end

Contract String => String
def encrypt(message)
  message = (message + ("X" * 5)).upcase.gsub(/[^A-Z]/, "")

  p message

  plainbytes = Enumerable::Enumerator.new(message, :each_byte).collect { |n| n - "A"[0] + 1 }

  p plainbytes
end

# Contract String, String => String
# def decrypt(message, key)
#   # ...
# end

encrypt "Boy howdy!\nI do declare."
