# Luhn algorithm
class Luhn
  def self.sum(n)
    checksum = 0

    odd = false

    while n > 0
      digit = n % 10

      if odd
        digit *= 2

        if digit > 9
          digit -= 9
        end
      end

      checksum += digit

      n /= 10
      odd = !odd
    end

    return checksum
  end

  def self.valid?(n)
    (sum(n) % 10) == 0
  end

  def self.complete(n)
    timesten = n * 10

    checksum = sum(timesten)

    digit=0

    modten = checksum % 10

    if modten != 0
      digit = 10 - modten
    end

    return timesten + digit
  end

  def self.generate(length = 16)
    n = rand(10 ** (length - 1))

    complete(n)
  end
end
