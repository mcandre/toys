functor
import
  System
  Application
export
  fizzbuzz:FizzBuzz
define
  fun {FizzBuzz N}
    case [(N mod 3) (N mod 5)] of [0 0] then "FizzBuzz"
    [] [0 _] then "Fizz"
    [] [_ 0] then "Buzz"
    else {Int.toString N} end
  end

  {ForAll {List.number 1 100 1}
   proc {$ N}
     {System.printInfo
      {FizzBuzz N}
      #[&\n]
     }
   end
  }

  {Application.exit 0}
end