#!/usr/bin/env lua

--[[

Author: Andrew Pennebaker (andrew.pennebaker@gmail.com)
Copyright: Copyright 2007 Andrew Pennebaker

]]

aplib=require("aplib")

http=require("socket.http")

function filename_from_url(url)
	local parts=url:split("/")

	return parts[#parts]
end

function main(arg)
	for i=1, #arg do
		local url=arg[i]

		print("Downloading " .. url)

		local filename=filename_from_url(url)
		local file=io.open(filename, "wb")

		local body=http.request(url)

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