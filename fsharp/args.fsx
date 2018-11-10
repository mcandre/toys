#light (*
    exec fsharpi --exec "$0" --quiet
*)

let main =
    let args = System.Environment.GetCommandLineArgs()

    for arg in args do
        printfn "%s" arg
