-- Paul Bissex's reverse.lua http://e-scribe.com/news/files/reverse.lua.html

math.randomseed(os.time())
math.random()

function flip(sequence, howmany)
	local flipped = {}
	for i=1, #sequence do
		if i<=howmany then
			flipped[i] = sequence[howmany+1-i]
		else
			flipped[i] = sequence[i]
		end
	end

	return flipped
end

function disordered(sequence)
	for i=2, #sequence do
		if sequence[i-1] > sequence[i] then
			return true
		end
	end

	return false
end

input = { 1, 2, 3, 4, 5, 6, 7, 8, 9 }
numbers = {}
for i=1,9 do
	table.insert(numbers, table.remove(input, math.random(#input)))
end

count = 0
while disordered(numbers) do
	io.write(table.concat(numbers, " ") .. "\nHow many to flip? ")
	howmany = tonumber(io.read())
	numbers = flip(numbers, howmany)
	count = count + 1
end

io.write("Done! That took you " .. count .. " steps.\n")