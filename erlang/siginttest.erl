-module(siginttest).
-author("andrew.pennebaker@gmail.com").
-export([main/1]).

main(_) ->
  io:format("Looping... Exit with Control+C.~n"),
  main(1).
