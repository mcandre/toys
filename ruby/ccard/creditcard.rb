require './luhn'
require 'contracts'
include Contracts

# Validate and generate credit card numbers
class CreditCard
  attr_reader :name, :short, :prefixes, :lengths, :sum

  Contract String, String, ArrayOf[Num], ArrayOf[Num], String => String
  def initialize(name, short, prefixes, lengths, sum)
    @name = name
    @short = short
    @prefixes = prefixes
    @lengths = lengths
    @sum = sum
  end

  Contract File => ArrayOf[CreditCard]
  def self.load_services(stream)
    require 'yaml'

    services = {}

    YAML.load(stream).each do |name, specs|
      short = specs['short']

      # if already arrays, no worries

      prefixes = specs['prefixes'].to_a
      lengths = specs['lengths'].to_a
      sum = specs['sum']

      services[short] = CreditCard.new(name, short, prefixes, lengths, sum)
    end

    services
  end

  Contract nil => Num
  def generate
    prefix = @prefixes[rand(@prefixes.length)]
    length = @lengths[rand(@lengths.length)]

    ten_raised = 10**(length - prefix.to_s.length - 1)

    n = prefix * ten_raised
    n += rand(ten_raised)

    if @sum == 'any'
      n = n * 10 + rand(10)
    elsif @sum == 'luhn'
      n = Luhn.complete(n)
    end

    n
  end

  Contract Num => Or[Bool, String]
  def valid?(n)
    return 'fails Luhn checksum' if @sum == 'luhn' && !Luhn.valid?(n.to_i)

    if @prefixes != 'any'
      prefix_matches = []

      @prefixes.each do |prefix|
        prefix = prefix.to_s

        prefix_matches.push(prefix) unless n[0, prefix.length] != prefix
      end

      return 'fails to match service prefix' if prefix_matches.length == 0
    end

    if @lengths != 'any'
      length_matches = []

      @lengths.each do |length|
        length_matches.push(length) unless n.length != length
      end

      return 'fails to match service length' if length_matches.length == 0
    end

    'passes'
  end
end
