//! Fibonacci

#![crate_id(name = "fib")]

fn fib(n : int) -> int {
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

fn main() {
  println!("Fib 40 = {}", fib(40).to_string());
}
