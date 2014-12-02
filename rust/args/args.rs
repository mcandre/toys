//! Command line arguments (argv)

extern crate std;

use std::os::args;
use std::vec::Vec;

fn main() {
  let args : Vec<String> = args();

  for arg in args.iter() {
    println!("{}", *arg);
  }
}
