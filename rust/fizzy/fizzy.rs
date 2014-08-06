extern crate std;

fn fizzbuzz(n: int) -> String {
  let mod3 = n % 3 == 0;
  let mod5 = n % 5 == 0;

  if mod3 && mod5 {
    return "FizzBuzz".to_string();
  }
  else if mod3 {
    return "Fizz".to_string();
  }
  else if mod5 {
    return "Buzz".to_string();
  }
  else {
    return n.to_str();
  }
}

fn main() {
  for n in range(1i, 101i) {
    println!("{}", fizzbuzz(n));
  }
}
