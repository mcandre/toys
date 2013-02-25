namespace Fizzy

module Fizzy =
  let fizzbuzz n =
    let x, y  = (n % 3, n % 5)

    if (x, y) = (0, 0) then
      "FizzBuzz"
    else if x = 0 then
      "Fizz"
    else if y = 0 then
      "Buzz"
    else
      n.ToString("d")

  let main =
    Array.iter (fun s -> printfn "%s" s) (Array.Parallel.map fizzbuzz [1 .. 101])
