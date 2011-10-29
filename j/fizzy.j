#!/usr/bin/env jconsole

div3 =: 0 = 3 & |

div5 =: 0 = 5 & |

div35 =: div3 *. div5

fizzy =: 3 : 0
	if. div35 y do.
		echo 'FizzBuzz'
	elseif. div3 y do.
		echo 'Fizz'
	elseif. div5 y do.
		echo 'Buzz'
	elseif. 1 do.
		echo > 'd' (8!:0) y
	end.
)

xs =: 1 + i. 100

fizzy"0 xs

exit ''