-module(args).
-export([main/1]).

main(Args) -> [io:format("~s~n", [A]) || A <- Args].