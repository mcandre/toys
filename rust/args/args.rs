//! Command line arguments (argv)

use std::os::args;
use std::vec::Vec;

fn main() {
  let argv : Vec<String> = args();

  for arg in argv.iter() {
    println!("{}", *arg);
  }
}
