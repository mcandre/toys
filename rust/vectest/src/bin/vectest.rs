//! Vector test

use std::env;
use std::option::Option;

fn main() {
  let mut args : env::Args = env::args();

  let program : Option<String> = args.next();

  match program {
    Some(p) => println!("Program: {}", p),
    None => println!("Program not found.")
  }
}
