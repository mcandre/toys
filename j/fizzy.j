#!/usr/bin/env jconsole

div3 =: 0 = 3 & |

div5 =: 0 = 5 & |

div35 =: div3 *. div5

fizzy =: monad : 0
	if. div35 y do.
		'FizzBuzz'
	elseif. div3 y do.
		'Fizz'
	elseif. div5 y do.
		'Buzz'
	elseif. 1 do.
		> 'd' (8!:0) y
	end.
)

xs =. 1 + i. 100

echo"1 fizzy"0 xs

exit ''