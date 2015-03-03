--[[

  Author: Andrew Pennebaker (andrew.pennebaker@gmail.com)
  Copyright: Copyright 2007 Andrew Pennebaker

]]

-- from Gavin Kistner's recipe http://lua-users.org/wiki/SplitJoin
function string:split(delimeter)
  local results = {}

  local start = 1
  local splitstart, splitend = string.find(self, delimeter, start)
  while splitstart do
    table.insert(results, string.sub(self, start, splitstart-1))
    start = splitend + 1
    splitstart, splitend = string.find(self, delimeter, start)
  end

  table.insert(results, string.sub(self, start))

  return results
end

-- from Peter Prade's recipe http://lua-users.org/wiki/SplitJoin
function string:join(list)
  if #list == 0 then
    return ""
  end

  local result = list[1]
  for i=2, #list do
    result = result .. self .. list[i]
  end

  return result
end

function string:lines()
  return coroutine.wrap(
    function ()
      for _, line in pairs(self:split("\n")) do
        coroutine.yield(line)
      end
    end
  )
end

-- from David Manura's recursive table to string methods http://lua-users.org/wiki/TableUtils

function table.val_to_str(v)
  if "string"==type(v) then
    v = string.gsub(v, "\n", "\\n")
    if string.match(string.gsub(v,"[^'\"]",""), '^"+$') then
      return "'" .. v .. "'"
    end

    return '"' .. string.gsub(v,'"', '\\"' ) .. '"'
  else
    return "table" == type(v) and table.tostring(v) or tostring(v)
  end
end

function string:iter_chars()
  return coroutine.wrap(
    function ()
      for i=1, self:len() do
        coroutine.yield(self:sub(i, i+1))
      end
    end
  )
end

function string:iter_bytes()
  return coroutine.wrap(
    function ()
      for c in self:iter_chars() do
        coroutine.yield(string.byte(c))
      end
    end
  )
end

function table.key_to_str(k)
  if "string"==type(k) and string.match(k, "^[_%a][_%a%d]*$") then
    return k
  else
    return "[" .. table.val_to_str(k) .. "]"
  end
end

function table.tostring(tbl)
  local result, done={}, {}
  for k, v in ipairs(tbl) do
    table.insert(result, table.val_to_str(v))
    done[k]=true
  end
  for k, v in pairs(tbl) do
    if not done[k] then
      table.insert(result, table.key_to_str( k ) .. "=" .. table.val_to_str(v))
    end
  end

  return "{" .. table.concat(result, ",") .. "}"
end

module(..., package.seeall)
