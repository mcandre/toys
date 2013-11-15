%% Compile
%%
%% erlc -Wall args.erl
%%
%% Run
%%
%% erl -noshell -s args -extra <arg> <arg> <arg>...

-module(args).
-export([start/0]).

start() ->
  io:format("~p~n", [init:get_plain_arguments()]),
  init:stop().
