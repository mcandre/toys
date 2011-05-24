#!/usr/bin/env lua

--[[

Andrew Pennebaker
Copyright 2007 Andrew Pennebaker

Credits: http://www.krugle.com/files/cvs/cvs.jabberstudio.org/neutron/plugins/time_plugin.py

]]

os=require("os")
math=require("math")

function get_timezone()
	return -1*os.date("%z")/100*60*60
end

function beats()
	local t=os.time()+get_timezone() -- os.time() apparently returns UTC
	local d=os.date("*t", t)
	local h, m, s=d.hour, d.min, d.sec

	local utc=3600*h+60*m+s -- Greenwich, England

	local bmt=utc+3600 -- Biel, Switzerland

	local beat=bmt/86.4

	if beat>1000 then
		beat=beat-1000
	end

	return beat
end

function swatch()
	return string.format("@%06.2f", beats())
end

if type(package.loaded[(...)]) ~= "userdata" then
	print(swatch())
else
	module(..., package.seeall)
end