//! Fibonacci

fn fib(n : i64) -> i64 {
  if n == 0 {
    return 0;
  }
  else if n == 1 {
    return 1;
  }
  else {
    return fib(n - 1) + fib(n - 2);
  }
}

#[test]
fn first_five_elements_are_correct() {
  assert_eq!(fib(0), 0);
  assert_eq!(fib(1), 1);
  assert_eq!(fib(2), 1);
  assert_eq!(fib(3), 2);
  assert_eq!(fib(4), 3);
}

fn main() {
  println!("Fib 40 = {}", fib(40).to_string());
}
