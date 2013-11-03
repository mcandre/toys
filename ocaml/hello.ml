if true then ignore begin let kkkk _ _ _ _ _ _ = 0 in kkkk
"exec" "ocaml" "-w" "+a" "$0" "$@" + let fi = 0 and exit _ _ = 0 in if false
then exit
fi
true else 0
end;;

(*

Interpret

./hello.ml

Compile

ocamlc -w +a -o hello hello.ml

Run

./hello

*)

let main = print_endline "Hello World!"
