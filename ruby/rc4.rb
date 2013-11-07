#!/usr/bin/env ruby

# Author:: Andrew Pennebaker
# Copyright:: Copyright 2007 Andrew Pennebaker
#
# == Usage
# rc4 [OPTIONS]
#
# --help, -h:
#    shows usage help
#
# --encrypt, -e <file1> <file2> <file3> ...:
#    encrypts infile to outfile (default mode)
#
# --decrypt, -d <file1> <file2> <file3> ...:
#    decrypts infile to outfile
#
# --key, -k <uuencoded key>:
#    specifies key for encryption/decryption
#
# --gen-key, -g [<length>]:
#    generates key (default length 8)

require 'base64'
require 'getoptlong'
require 'contracts'
include Contracts

#
# Substitution Box
#
class SBox
  Contract ArrayOf[Num] => ArrayOf[Num]
  def initialize(key = [0])
    @s = (0 .. 255).to_a

    keypos = 0
    index = 0

    [0 .. 255].each do |counter|
      index = (key[keypos % key.length] + counter + index) % 256
      swap(@s, counter, index)
      keypos += 1
    end

    @x, @y = 0, 0
  end

  Contract ArrayOf[Num] => ArrayOf[Num]
  def self.swap(items, a, b)
    items[a], items[b] = items[b], items[a]
  end

  Contract nil => Num
  def next_byte
    @x = (@x + 1) % 256
    @y = (@s[@x] + @y) % 256

    swap(@s, @x, @y)

    @s[(@x + @y) % 256]
  end
end

# RC4 algorithm
class RC4
  Contract ArrayOf[Num] => SBox
  def set_key(key)
    @sbox = SBox.new(key)
  end

  Contract Num => ArrayOf[Num]
  def gen_key(length = 8)
    fail 'Key length must be >= 1' unless length >= 1

    key = []
    [0 .. length].each do |i|
      key.push((rand * 256).to_i)
    end

    key
  end

  Contract Num => Num
  def encrypt(b)
    b ^ @sbox.next_byte
  end

  Contract Num => Num
  def decrypt(b)
    encrypt(b)
  end

  Contract ArrayOf[Num] => String
  def self.format_bytes(bytes)
    Base64.encode64(bytes.join('')).chomp
  end

  Contract String => ArrayOf[Num]
  def self.unformat_bytes(line)
    bytes = []
    Base64.decode64(line).each_byte { |e| bytes.push(e) }
    bytes
  end
end

Contract String, RC4, ArrayOf[Num] => File
def encrypt(filename, cipher, key)
  cipher.set_key(RC4.unformat_bytes(key))

  infile = open(filename, 'rb')
  outfile = open("#{filename}.rc4", 'wb')

  # include original filename as first line in outfile
  bytes = []

  filename.each_byte do |b|
    bytes.push(cipher.encrypt(b).chr)
  end

  outfile.write(RC4.format_bytes(bytes))
  outfile.write('\n')

  line = ''

  until infile.eof?
    line = infile.read(1024, line)

    bytes = []

    line.each_byte do |b|
      bytes.push(cipher.encrypt(b).chr)
    end

    outfile.write(RC4.format_bytes(bytes))
    outfile.write('\n')
  end

  infile.close
  outfile.close
end

Contract String, RC4, ArrayOf[Num] => File
def decrypt(filename, cipher, key)
  cipher.set_key(RC4.unformat_bytes(key))

  infile = open(filename, 'rb')

  # original filename is included as first line in infile
  bytes = []

  RC4.unformat_bytes(infile.readline).each do |b|
    bytes.push(cipher.decrypt(b).chr)
  end

  original_filename = bytes.join('')

  outfile = open(original_filename, 'wb')

  infile.each do |line|
    bytes = []

    RC4.unformat_bytes(line).each do |b|
      bytes.push(cipher.encrypt(b).chr)
    end

    outfile.write(bytes)
  end

  infile.close
  outfile.close
end

Contract nil => nil
def usage
  system("more #{$PROGRAM_NAME}")
  exit(0)
end

def main
  mode = :encrypt
  key = ''
  length = 8

  opts = GetoptLong.new(
    ['--help', '-h', GetoptLong::NO_ARGUMENT],
    ['--encrypt', '-e', GetoptLong::NO_ARGUMENT],
    ['--decrypt', '-d', GetoptLong::NO_ARGUMENT],
    ['--key', '-k', GetoptLong::REQUIRED_ARGUMENT],
    ['--gen-key', '-g', GetoptLong::OPTIONAL_ARGUMENT]
  )

  opts.each do |option, value|
    case option
    when '--help'
      usage
    when '--encrypt'
      mode = :encrypt
    when '--decrypt'
      mode = :decrypt
    when '--key'
      key = value
    when '--gen-key'
      mode = :gen_key
      length = value.to_i
      length = 8 unless length >= 1
    else
      usage
    end
  end

  cipher = RC4.new

  case mode
  when :gen_key
    puts RC4.format_bytes(cipher.gen_key(length))
  when :encrypt
    ARGV.each do |filename|
      encrypt(filename, cipher, key)
    end
  when :decrypt
    ARGV.each do |filename|
      decrypt(filename, cipher, key)
    end
  else
    usage
  end
end

if $PROGRAM_NAME == __FILE__
  begin
    main
  rescue Interrupt
    nil
  end
end
