#!/usr/bin/env lua

local main
main = function(arg)
    print("Hello World!")
end

if type(package.loaded[(...)]) ~= "userdata" then
    main(arg)
else
    module(..., package.seeall)
end
