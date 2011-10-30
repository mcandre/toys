NB.       _1 if x < y
NB. cmp =  1 if y > x
NB.        0 if x = y

cmp =: dyad : 0
	c =: x \:@,&< y
	e =: x -: y

	if. c = 1 0 do.
		_1
	elseif. e = 0 do.
		1
	elseif. 1 do.
		0
	end.
)