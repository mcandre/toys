functor
import
  System
  Application
define
  local
    Argv = {Application.getCmdArgs
            record(help(rightmost char: [&h] type: bool default: false))}
  in
    {ForAll
     Argv.1
     proc {$ Arg} {System.printInfo Arg#"\n"} end
    }
    {Application.exit 0}
  end
end
