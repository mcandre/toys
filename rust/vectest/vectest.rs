extern crate std;

use std::os::args;
use std::vec::Vec;
use std::option::Option;

fn main() {
  let args : Vec<String> = args();

  assert_eq!(args.len() > 0, true);

  let program : Option<&String> = args.as_slice().head();

  match program {
    Some(p) => println!("Program: {}", p),
    None => println!("Program not found.")
  }
}
