#!/usr/bin/env lua

--[[

  Author: Andrew Pennebaker (andrew.pennebaker@gmail.com)
  Copyright: Copyright 2007 Andrew Pennebaker

]]

require("aplib")

require("socket.http")

local filenameFromURL
filenameFromURL = function(url)
  local parts = url:split("/")

  return parts[#parts]
end

local main
main = function(arg)
  for i = 1, #arg do
    local url = arg[i]

    print("Downloading " .. url)

    local filename = filenameFromURL(url)
    local file = io.open(filename, "wb")

    local body = http.request(url)

    file:write(body)
    file:close()

    print("Done")
  end
end

if type(package.loaded[(...)]) ~= "userdata" then
  main(arg)
else
  module(..., package.seeall)
end
