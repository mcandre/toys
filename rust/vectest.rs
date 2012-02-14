use std;

fn main(args: [str]) {
	check vec::is_not_empty(args);
	let program : str = vec::head(args);
	std::io::println("Program: " + program);
}