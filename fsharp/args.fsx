let main =
    let args = System.Environment.GetCommandLineArgs()

    for arg in args do
        printfn "%s" arg