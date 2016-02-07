%% Example:
%%
%% matlab -nojvm -nodisplay -nosplash -r "disp(fib(10)); exit" | tail -n +11

function y = fib(n)
  if n <= 0
    y = 0;
  elseif n == 1
    y = 1;
  else
    y = fib(n - 1) + fib(n - 2);
  end
end
