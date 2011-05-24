require "luhn"

class CreditCard
	attr_reader :name, :short, :prefixes, :lengths, :sum

	def initialize(name, short, prefixes, lengths, sum)
		@name=name
		@short=short
		@prefixes=prefixes
		@lengths=lengths
		@sum=sum
	end

	def self.load_services(stream)
		require "yaml"

		services={}

		YAML::load(stream).each { |name, specs|
			short=specs["short"]

			# if already arrays, no worries

			prefixes=specs["prefixes"].to_a
			lengths=specs["lengths"].to_a
			sum=specs["sum"]

			services[short]=CreditCard.new(name, short, prefixes, lengths, sum)
		}

		return services
	end

	def generate
		prefix=@prefixes[rand(@prefixes.length)]
		length=@lengths[rand(@lengths.length)]

		n=prefix*(10**(length-prefix.to_s.length-1))
		n+=rand(10**(length-prefix.to_s.length-1))

		if @sum == "any"
			n=n*10+rand(10)
		elsif @sum == "luhn"
			n=Luhn.complete(n)
		end

		return n
	end

	def valid?(n)
		if @sum == "luhn" and not Luhn.valid?(n.to_i)
			return "fails Luhn checksum"
		end

		if @prefixes != "any"
			prefix_matches=[]

			@prefixes.each { |prefix|
				prefix=prefix.to_s

				if n[0, prefix.length]==prefix
					prefix_matches.push(prefix)
				end
			}

			if prefix_matches.length==0
				return "fails to match service prefix"
			end
		end

		if @lengths != "any"
			length_matches=[]

			@lengths.each { |length|
				if n.length==length
					length_matches.push(length)
				end
			}

			if length_matches.length==0
				return "fails to match service length"
			end
		end

		return "passes"
	end
end