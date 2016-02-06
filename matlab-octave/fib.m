#!/usr/bin/env octave -qf

function f = fib(n)
  if (n == 0)
    f = 0;
  elseif (n == 1)
    f = 1;
  else
    f = fib(n - 1) + fib(n - 2);
  endif
endfunction

function main()
  disp(fib(10));
endfunction

main();
