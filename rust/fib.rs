#[link(name = "fib")];

use std;

fn fib(n : int) -> int {
  if (n == 0) {
    ret 0;
  }
  else if (n == 1) {
    ret 1;
  }
  else {
    ret fib(n - 1) + fib(n - 2);
  }
}

fn main() {
  std::io::println("Fib 40 = " + core::int::to_str(fib(40), 10u));
}
