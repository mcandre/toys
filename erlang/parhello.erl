-module(parhello).
-author("andrew.pennebaker@gmail.com").
-export([hello/1, main/1]).

-import(lists, [map/2]).

hello(C) ->
	io:format("~c", [C]).

main(_) ->
	lists:map(fun(C) -> spawn(parhello, hello, [C]) end, "Hello World!").
