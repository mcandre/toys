extern crate std;

use std::io::println;

fn fizzbuzz(n: int) -> ~str {
  let mod3 = n % 3 == 0;
  let mod5 = n % 5 == 0;

  if mod3 && mod5 {
    return "FizzBuzz".to_owned();
  }
  else if mod3 {
    return "Fizz".to_owned();
  }
  else if mod5 {
    return "Buzz".to_owned();
  }
  else {
    return n.to_str();
  }
}

fn main() {
  for n in range(1, 101) {
    println(fizzbuzz(n));
  }
}
