%% Compile
%%
%% erlc -Wall hello.erl
%%
%% Run
%%
%% erl -s hello -noshell

-module(hello).
-author("andrew.pennebaker@gmail.com").
-export([start/0]).

start() ->
  io:format("Hello World!~n"),
  init:stop().
