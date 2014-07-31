#!/usr/bin/env lua

--[[

  Andrew Pennebaker
  Copyright 2007 Andrew Pennebaker

  Credits: http://www.krugle.com/files/cvs/cvs.jabberstudio.org/neutron/plugins/time_plugin.py

]]

require("os")

Swatch = {}

local get_timezone
get_timezone = function()
  return -1 * os.date("%z") / 100 * 60 * 60
end

local beats
beats = function()
  local t = os.time() + get_timezone() -- os.time() apparently returns UTC
  local d = os.date("*t", t)
  local h, m, s = d.hour, d.min, d.sec

  local utc = 3600 * h + 60 * m + s -- Greenwich, England

  local bmt = utc + 3600 -- Biel, Switzerland

  local beat = bmt / 86.4

  if beat > 1000 then
    beat = beat - 1000
  end

  return beat
end
Swatch.beats = beats

local swatch
swatch = function()
  return string.format("@%06.2f", beats())
end
Swatch.swatch = swatch

local main
main = function(arg)
  print(swatch())
end

if type(package.loaded[(...)]) ~= "userdata" then
  main()
else
  module(..., package.seeall)
end
