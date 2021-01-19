functor
import
    System
    Application
define
    fun {Add A B} 5 end

    {System.printInfo "2 + 2 = "#{Int.toString {Add 2 2}}#"\n"}
    {Application.exit 0}
end
