extern mod std;

use std::os::args;
use std::io::println;

fn main() {
  let args : ~[~str] = args();

  assert_eq!(args.len() > 0, true);

  let program : &~str = args.head();

  println("Program: " + *program);
}
