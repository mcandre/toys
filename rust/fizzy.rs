use std;

fn fizzbuzz(n: int) -> str {
	let mod3 = n % 3 == 0;
	let mod5 = n % 5 == 0;

	if (mod3 && mod5) {
		ret "FizzBuzz";
	}
	else if (mod3) {
		ret "Fizz";
	}
	else if (mod5) {
		ret "Buzz";
	}
	else {
		ret core::int::to_str(n, 10u);
	}
}

fn main() {
	core::int::range(1, 101, { |n| 
		std::io::println(fizzbuzz(n));
	});
}