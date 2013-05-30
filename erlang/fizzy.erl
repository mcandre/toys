%% Compile
%%
%% erlc fizzy.erl
%%
%% Run
%%
%% erl -noshell -s fizzy

-module(fizzy).
-author("andrew.pennebaker@gmail.com").
-export([fizzbuzz/1, start/0]).

fizzbuzz(N) ->
  X = N rem 3,
  Y = N rem 5,
  case {X,Y} of
    {0,0} -> "FizzBuzz";
    {0,_} -> "Fizz";
    {_,0} -> "Buzz";
    _ -> io_lib:format("~b", [N])
  end.

start() ->
  [ io:format("~s\n", [Fb]) ||
    Fb <- rpc:pmap({fizzy, fizzbuzz}, [], lists:seq(1, 100)) ],
  init:stop().
