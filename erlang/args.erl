-module(args).
-export([main/1]).
-import(lists, [map/2]).

main(Args) ->
	map (fun(Arg) -> io:format("~s~n", [Arg]) end, Args).