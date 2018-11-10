%% Compile
%%
%% erlc -Wall siginttest.erl
%%
%% Run
%%
%% erl -noshell -s siginttest

-module(siginttest).
-author("andrew.pennebaker@gmail.com").
-export([start/0]).

start() ->
    io:format("Looping... Exit with Control+C.~n"),
    start().
