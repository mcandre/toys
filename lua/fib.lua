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

function main(arg)
  local n=tonumber(arg[1])
  local x=fib(n)
  print("fib(" .. n .. ") = " .. x)
end

if type(package.loaded[(...)]) ~= "userdata" then
	main(arg)
else
	module(..., package.seeall)
end
