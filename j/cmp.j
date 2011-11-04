NB. cmp - Andrew Pennebaker
NB.
NB. A general comparison for arbitrary data structures:
NB. Integers, strings, arrays, etc.
NB.
NB.       _1 if x < y
NB. cmp =  1 if y > x
NB.        0 if x = y

cmp =: dyad : 0
	if. (x \:@,&< y) = 1 0 do.
		_1
	elseif. (x -: y) = 0 do.
		1
	elseif. 1 do.
		0
	end.
)

lt =: _1 = cmp

gt =: 1 = cmp

eq =: 0 = cmp

lte =: 0 = gt

gte =: 0 = lt