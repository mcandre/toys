extern crate std;

use std::os::args;
use std::io::println;
use std::option::Option;

fn main() {
  let args : ~[~str] = args();

  assert_eq!(args.len() > 0, true);

  let program : Option<&~str> = args.head();

  match program {
    Some(p) => println("Program: " + *p),
    None => println("Program not found.")
  }
}
