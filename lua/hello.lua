#!/usr/bin/env lua

function main(arg)
  print("Hello World!")
end

if type(package.loaded[(...)]) ~= "userdata" then
	main(arg)
else
	module(..., package.seeall)
end
