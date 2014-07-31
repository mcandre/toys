#!/usr/bin/env lua

local main
main = function(arg)
  for i, value in ipairs(arg) do
    print("Arg[" .. i .. "] = " .. value)
  end
end

if type(package.loaded[(...)]) ~= "userdata" then
	main(arg)
else
	module(..., package.seeall)
end
