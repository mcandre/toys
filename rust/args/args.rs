extern crate std;

use std::io::println;
use std::os::args;

fn main() {
    let args : ~[~str] = args();

  for arg in args.iter() {
    println(*arg);
  }
}
