class Luhn
	def self.sum(n)
		checksum=0

		odd=false

		while n>0
			digit=n % 10

			if odd
				digit*=2

				if digit>9
					digit-=9
				end
			end

			checksum+=digit

			n/=10
			odd=!odd
		end

		return checksum
	end

	def self.valid?(n)
		return (sum(n) % 10)==0
	end

	def self.complete(n)
		checksum=sum(n*10)

		digit=0

		if (checksum % 10) !=0
			digit=10 - (checksum % 10)
		end

		return n*10+digit
	end

	def self.generate(length=16)
		n=rand(10**(length-1))

		return complete(n)
	end
end