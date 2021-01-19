#!/usr/bin/env escript
%%! -noinput -pa ../cecho/ebin +A 50

-module(hellocecho).
-author("andrew.pennebaker@gmail.com").
-mode(compile).
-export([main/1]).
-include_lib("cecho/include/cecho.hrl").

%% From Mazen Harake's "cecho -- An ncurses library for Erlang"
%% http://mazenharake.wordpress.com/2010/02/16/cecho-an-ncurses-library-for-erlang/

ctrl() ->
    case cecho:getch() of
        %% Control+C or 'q'
        $q ->
            application:stop(cecho),
            halt();
        _ ->
            ctrl()
    end.

main(_) ->
    application:start(cecho),
    cecho:cbreak(),
    cecho:noecho(),
    cecho:curs_set(?ceCURS_INVISIBLE),

    cecho:mvaddstr(0, 0, "Hello World!"),
    cecho:refresh(),
    ctrl().
