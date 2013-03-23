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

  fun {ParMap Xs F}
    case Xs of nil then nil
    [] X|Xr then thread {F X} end |{ParMap Xr F}
    end
  end

  {ForAll {ParMap {List.number 1 100 1} FizzBuzz}
   proc {$ S} {System.printInfo S#[&\n]} end
  }

  {Application.exit 0}
end