%% Compile
%%
%% erlc -Wall nnbottles.erl
%%
%% Run
%%
%% erl -noshell -s nnbottles

-module(nnbottles).
-author("andrew.pennebaker@gmail.com").
-export([sing/1, start/0]).

sing(1) ->
  io:format("1 bottle of beer on the wall, 1 bottle of beer!~n"),
  io:format("Take one down, pass it around, no more bottles of beer on the wall.~n");
sing(I) ->
  io:format("~w bottles of beer on the wall, ~w bottles of beer!~n", [I, I]),
  io:format("Take one down, pass it around, ~w bottles of beer on the wall.~n~n", [I-1]),
  sing(I-1).

start() ->
  sing(99),
  init:stop().
