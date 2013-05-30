%% Compile
%%
%% erlc args.erl
%%
%% Run
%%
%% erl -noshell -s args -- <arg> <arg> <arg>...

-module(args).
-export([start/0]).

start() ->
  io:format("~p~n", [init:get_plain_arguments()]),
  init:stop().
