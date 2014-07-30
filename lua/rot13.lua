#!/usr/bin/env lua

aplib=require("aplib")
math=require("math")

local BIG_A=65    -- string.byte("A")
local BIG_Z=90    -- string.byte("Z")
local SMALL_A=97  -- string.byte("a")
local SMALL_Z=122 -- string.byte("z")

local KEY=13

local ALPHABET=26

function encrypt(b)
  local c=0

  if b>=BIG_A and b<=BIG_Z then
    c=math.mod((b-BIG_A+KEY), ALPHABET)+BIG_A
  elseif b>=SMALL_A and b<=SMALL_Z then
    c=math.mod((b-SMALL_A+KEY), ALPHABET)+SMALL_A
  else
    c=b
  end

  return c
end

function main(arg)
  for line in io.lines() do
    for b in line:iter_bytes() do
      io.write(string.char(encrypt(b)))
    end
    print()
  end
end

if type(package.loaded[(...)]) ~= "userdata" then
  main(arg)
else
  module(..., package.seeall)
end
