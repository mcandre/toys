require 'contracts'
include Contracts

# Luhn algorithm
class Luhn
  Contract Num => Num
  def self.sum(n)
    checksum = 0

    odd = false

    while n > 0
      digit = n % 10

      if odd
        digit *= 2

        digit -= 9 unless digit <= 9
      end

      checksum += digit

      n /= 10
      odd = !odd
    end

    checksum
  end

  Contract Num => Bool
  def self.valid?(n)
    (sum(n) % 10) == 0
  end

  Contract Num => Num
  def self.complete(n)
    timesten = n * 10

    checksum = sum(timesten)

    digit = 0

    modten = checksum % 10

    digit = 10 - modten unless modten == 0

    timesten + digit
  end

  Contract Num => Num
  def self.generate(length = 16)
    n = rand(10 ** (length - 1))

    complete(n)
  end
end
