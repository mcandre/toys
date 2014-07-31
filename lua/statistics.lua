--[[

  Author: Andrew Pennebaker (andrew.pennebaker@gmail.com)
  Date: 9 Sep 2007
  Copyright: Copyright 2007 Andrew Pennebaker

]]

Statistics = {}

local factorial
factorial = function(n)
  if n == 1 or n == 0 then
    return 1
  elseif n == 2 then
    return 2
  else
    return n * factorial(n - 1)
  end
end
Statistics.factorial = factorial

local choose
choose = function(n, k)
  if n == k then
    return 1
  else
    return factorial(n) / (factorial(n - k) * factorial(k))
  end
end
Statistics.choose = choose

module(..., package.seeall)
