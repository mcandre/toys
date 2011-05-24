#!/usr/bin/env lua

parser="http://yubnub.org/parser/parse?command="

command=table.concat(arg, "+")

os.execute("open " .. parser .. command)