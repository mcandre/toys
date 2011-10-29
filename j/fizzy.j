#!/usr/bin/env jconsole

div3 =: 0 = 3 & |

div5 =: 0 = 5 & |

div35 =: div3 *. div5

fizzy =: 3 : 0
	if. div35 & do.
		'FizzBuzz'
	elseif. div3 & do.
		'Fizz'
	elseif. div5 & do.
		'Buzz'
	elseif. 1 do.
		> 'd' (8!:0) &
	end.
)

fizzy 1

NB. > 'd' (8!:0)/ 1 +/ i. 100

exit ''