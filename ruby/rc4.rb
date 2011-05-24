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

require "base64"

require "getoptlong"
require "rdoc/usage"

class SBox
	def initialize(key=[0])
		@s=(0..255).to_a

		keypos=0
		index=0

		0.upto(255) { |counter|
			index=(key[keypos%key.length]+counter+index)%256
			swap(@s, counter, index)
			keypos+=1
		}

		@x, @y=0, 0
	end

	def swap(items, a, b)
		items[a], items[b]=items[b], items[a]
	end

	def next_byte
		@x=(@x+1)%256
		@y=(@s[@x]+@y)%256

		swap(@s, @x, @y)

		return @s[(@x+@y)%256]
	end
end

class RC4
	def set_key(key)
		@sbox=SBox.new(key)
	end

	def gen_key(length=8)
		raise "Key length must be >= 1" unless length>=1

		key=[]
		0.upto(length) { |i|
			key.push((rand()*256).to_i)
		}

		return key
	end

	def encrypt(b)
		return b^@sbox.next_byte
	end

	def decrypt(b)
		return encrypt(b)		
	end

	def format_bytes(bytes)
		return Base64.encode64(bytes.join("")).chomp()
	end

	def unformat_bytes(line)
		bytes=[]
		Base64.decode64(line).each_byte { |e|
			bytes.push(e)
		}

		return bytes
	end

	def format_key(key)
		return format_bytes(key)
	end

	def unformat_key(key)
		return unformat_bytes(key)
	end
end

def encrypt(filename, cipher, key)
	cipher.set_key(cipher.unformat_key(key))

	infile=open(filename, "rb")
	outfile=open("#{filename}.rc4", "wb")

	# include original filename as first line in outfile
	bytes=[]
	filename.each_byte { |b|
		bytes.push(cipher.encrypt(b).chr)
	}
	outfile.write(cipher.format_bytes(bytes))
	outfile.write("\n")

	line=""
	while not infile.eof?
		line=infile.read(1024, line)
		bytes=[]
		line.each_byte { |b|
			bytes.push(cipher.encrypt(b).chr)
		}
		outfile.write(cipher.format_bytes(bytes))
		outfile.write("\n")
	end

	infile.close()
	outfile.close()
end

def decrypt(filename, cipher, key)
	cipher.set_key(cipher.unformat_key(key))

	infile=open(filename, "rb")

	# original filename is included as first line in infile
	bytes=[]
	cipher.unformat_bytes(infile.readline).each { |b|
		bytes.push(cipher.decrypt(b).chr)
	}
	original_filename=bytes.join("")

	outfile=open(original_filename, "wb")

	infile.each { |line|
		bytes=[]
		cipher.unformat_bytes(line).each { |b|
			bytes.push(cipher.encrypt(b).chr)
		}
		outfile.write(bytes)
	}

	infile.close()
	outfile.close()
end

def main
	mode = :encrypt
	key = ""
	length = 8

	opts=GetoptLong.new(
		["--help", "-h", GetoptLong::NO_ARGUMENT],
		["--encrypt", "-e", GetoptLong::NO_ARGUMENT],
		["--decrypt", "-d", GetoptLong::NO_ARGUMENT],
		["--key", "-k", GetoptLong::REQUIRED_ARGUMENT],
		["--gen-key", "-g", GetoptLong::OPTIONAL_ARGUMENT]
	)

	opts.each { |option, value|
		case option
		when "--help"
			RDoc::usage("Usage")
		when "--encrypt"
			mode = :encrypt
		when "--decrypt"
			mode = :decrypt
		when "--key"
			key = value
		when "--gen-key"
			mode = :gen_key
			length=value.to_i
			length=8 unless length>=1
		end
	}

	cipher=RC4.new()

	case mode
	when :gen_key
		puts cipher.format_key(cipher.gen_key(length))
	when :encrypt
		ARGV.each { |filename|
			encrypt(filename, cipher, key)
		}
	when :decrypt
		ARGV.each { |filename|
			decrypt(filename, cipher, key)
		}
	end
end

if __FILE__==$0
	begin
		main
	rescue Interrupt => e
		nil
	rescue RuntimeError => e
		puts e.message
	end
end