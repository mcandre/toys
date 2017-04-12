//! FizzBuzz

fn fizzbuzz(n: i64) -> String {
  return match (n % 3 == 0, n % 5 == 0) {
    (true, true) => "FizzBuzz".to_string(),
    (true, _) => "Fizz".to_string(),
    (_, true) => "Buzz".to_string(),
    _ => n.to_string()
  };
}

#[test]
fn smoketest() {
  assert_eq!(fizzbuzz(3), "Fizz");
  assert_eq!(fizzbuzz(5), "Buzz");
  assert_eq!(fizzbuzz(15), "FizzBuzz");
}

fn main() {
  for n in 1..101 {
    println!("{}", fizzbuzz(n));
  }
}
