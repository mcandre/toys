require './fizzy'

describe Fixnum, "#fizz" do
  it "returns FizzBuzz" do
    one = 1
    expect(one.fizz).to eq("1")

    two = 2
    expect(two.fizz).to eq("2")

    three = 3
    expect(three.fizz).to eq("Fizz")

    four = 4
    expect(four.fizz).to eq("4")

    five = 5
    expect(five.fizz).to eq("Buzz")

    six = 6
    expect(six.fizz).to eq("Fizz")

    seven = 7
    expect(seven.fizz).to eq("7")

    fifteen = 15
    expect(fifteen.fizz).to eq("FizzBuzz")
  end
end
