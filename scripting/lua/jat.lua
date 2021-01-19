#!/usr/bin/env lua

-- JAT: The Joy of ASCII Art
-- http://codegolf.com/bob-ross-the-joy-of-ascii-art

require("aplib")

local mark
mark = function(rows, x, y, c)
    local space = " "

    x = x + 1
    y = y + 1

    for i = 1, y - #rows do
        table.insert(rows, {})
    end

    for i = 1, x - #rows[y] do
        table.insert(rows[y], space)
    end

    rows[y][x] = c
end

local print_pic
print_pic = function(rows)
    for i, row in ipairs(rows) do
        print((""):join(row))
    end
end

local main
main = function(arg)
    local rows = {}

    for line in io.lines() do
        if line:len() == 0 then
            break
        end

        local parts = line:split(" ")

        local x, y, c = tonumber(parts[1]), tonumber(parts[2]), string.char(tonumber(parts[3]))

        mark(rows, x, y, c)
    end

    print_pic(rows)
end

if type(package.loaded[(...)]) ~= "userdata" then
    main(arg)
else
    module(..., package.seeall)
end
