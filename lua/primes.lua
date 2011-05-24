#!/usr/bin/env lua

-- Generate primes as you go

require "math"

function get_primes(n)
	if n<2 then
		return {}
	elseif n<3 then
		return {2}
	end

	local numbers={}
	for i=3, n do
		table.insert(numbers, i)
	end

	local primes={2}
	for i=1, #numbers do
		local e=numbers[i]

		local factor_exists=false

		for _, f in pairs(primes) do
			if math.mod(e, f)==0 then
				factor_exists=true
				break
			end
		end

		if not factor_exists then
			table.insert(primes, e)
		end
	end

	return primes
end

function main(arg)
	local n=100

	if #arg>=1 then
		n=tonumber(arg[1])
	end

	print("Searching ...")

	local primes=get_primes(n)

	print("Primes <= " .. n .. ":")
	print(table.concat(primes, " "))
end

if type(package.loaded[(...)]) ~= "userdata" then
	main(arg)
else
	module(..., package.seeall)
end