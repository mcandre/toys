#!/usr/bin/env lua

Fib = {}

local fib
fib = function(n)
  if n < 2 then
    return n
  else
    local a, b = 0, 1

    local m = n-1

    local i = 0
    while i < m do
      a, b = b, a + b
      i = i + 1
    end

    return b
  end
end
Fib.fib = fib

local main
main = function(arg)
  local n = tonumber(arg[1])
  local x = fib(n)
  print("fib(" .. n .. ") = " .. x)
end

if type(package.loaded[(...)]) ~= "userdata" then
  main(arg)
else
  module(..., package.seeall)
end
