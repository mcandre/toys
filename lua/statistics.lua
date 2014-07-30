--[[

  Author: Andrew Pennebaker (andrew.pennebaker@gmail.com)
  Date: 9 Sep 2007
  Copyright: Copyright 2007 Andrew Pennebaker

]]

function factorial(n)
  if n==1 or n==0 then
    return 1
  elseif n==2 then
    return 2
  else
    return n*factorial(n-1)
  end
end

function choose(n, k)
  if n==k then
    return 1
  else
    return factorial(n)/(factorial(n-k)*factorial(k))
  end
end

module(..., package.seeall)
