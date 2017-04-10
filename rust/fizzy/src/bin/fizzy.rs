//! FizzBuzz

fn fizzbuzz(n: i64) -> String {
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
    return n.to_string();
  }
}

fn main() {
  for n in 1..101 {
    println!("{}", fizzbuzz(n));
  }
}
