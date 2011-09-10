#! /usr/bin/env factor

USING: kernel io math prettyprint combinators sequences ;
IN: fizzbuzz

: fizzbuzz ( -- seq )
    100 iota
    [
        1 +
        {
            { [ dup dup 3 mod 0 = swap 5 mod 0 = and ] [ drop "FizzBuzz" ] }
            { [ dup 3 mod 0 = ] [ drop "Fizz" ] }
            { [ dup 5 mod 0 = ] [ drop "Buzz" ] }
            [ unparse ]
        } cond
    ] map
    "\n" join ;

: main ( -- ) fizzbuzz print ;

MAIN: main