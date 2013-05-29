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
  lists:map(fun(Arg) -> io:format("~s~n", [Arg]) end, init:get_plain_arguments()),
  init:stop().
