#!/usr/bin/env lua

function fib(n)
	if n<2 then
		return n
	else
		local a, b=0, 1

		local m=n-1

		local i=0
		while i<m do
			a, b=b, a+b
			i=i+1
		end

		return b
	end
end

-- recursive overhead is slow

--[[

function fib(n)
	if n==0 then
		return 0
	elseif n==1 then
		return 1
	else
		return fib(n-1)+fib(n-2)
	end
end

]]

io.write("N = ")

local n=tonumber(io.read())

local startt=os.time()

print("Running")

local x=fib(n)

local endt=os.time()

print("Fib " .. n .. " = " .. x)
print("Time = ".. (endt-startt) .. " sec")