#!/usr/bin/env lua

-- Sieve of Eratosthenes

-- require "math"
require("primes")

function table.index(t, o)
    for i, e in ipairs(t) do
        if e==o then
            return i
        end
    end

    return -1
end

local sieve
sieve = function(n)
    if n < 2 then
        return {}
    elseif n < 3 then
        return {2}
    end

    local base_primes = Primes.get_primes(math.sqrt(n))

    print("Base primes:")
    print(table.concat(base_primes, " "))

    local numbers = {}
    for i = 2, n do
        -- Do not include primes already in base_primes
        if table.index(base_primes, i) == -1 then
            table.insert(numbers, i)
        end
    end

    -- Strikeout the multiples of the base primes
    for _, p in pairs(base_primes) do
        for i = 1, #numbers do
            -- If not marked and if divisible by p
            if numbers[i] ~= 0 and numbers[i] % p == 0 then
                -- Mark as compound
                numbers[i] = 0
            end
        end
    end

    -- Add unmarked numbers to primes
    for i = 1, #numbers do
        if numbers[i] ~= 0 then
            table.insert(base_primes, numbers[i])
        end
    end

    return base_primes
end

local main
main = function(arg)
    local n = 100

    if #arg >= 1 then
        n = tonumber(arg[1])
    end

    print("Searching ...")

    local primes = sieve(n)

    print("Primes <= " .. n .. ":")
    print(table.concat(primes, " "))
end

if type(package.loaded[(...)]) ~= "userdata" then
    main(arg)
else
    module(..., package.seeall)
end
