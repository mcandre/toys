#!/usr/bin/env lua

local parser="http://yubnub.org/parser/parse?command="

local command=table.concat(arg, "+")

os.execute("open " .. parser .. command)