#!/usr/bin/env lua

local main
main = function()
  local parser="http://yubnub.org/parser/parse?command="

  local command=table.concat(arg, "+")

  os.execute("open " .. parser .. command)
end

if type(package.loaded[(...)]) ~= "userdata" then
  main(arg)
else
  module(..., package.seeall)
end
