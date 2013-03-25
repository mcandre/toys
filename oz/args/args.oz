functor
import
  System
  Application
  Property
define
  local
    Url = {Property.get 'application.url'}
    Args = {Property.get 'application.args'}
    Argv = {Application.getCmdArgs
            record(help(rightmost char: [&h] type: bool default: false))}
  in

    {System.printInfo "Url: "#Url#"\n"}

    {System.printInfo "Args:\n"}

    {ForAll
     Args
     proc {$ Arg} {System.printInfo Arg#"\n"} end
    }

    {System.printInfo "Argv:\n"}

    {ForAll
     Argv.1
     proc {$ Arg} {System.printInfo Arg#"\n"} end
    }

    {Application.exit 0}
  end
end
