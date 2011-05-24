#!/usr/bin/env lua

function fib(n)
	if n<2 then
		return n
	else
		a, b=0, 1

		m=n-1

		i=0
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

n=tonumber(io.read())

startt=os.time()

print("Running")

x=fib(n)

endt=os.time()

print("Fib " .. n .. " = " .. x)
print("Time = ".. (endt-startt) .. " sec")