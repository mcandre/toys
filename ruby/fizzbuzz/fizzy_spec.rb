require './fizzy'

describe Fixnum, "#fizz" do
  it "returns FizzBuzz" do
    one = 1
    one.fizz.should == "1"

    two = 2
    two.fizz.should == "2"

    three = 3
    three.fizz.should == "Fizz"

    four = 4
    four.fizz.should == "4"

    five = 5
    five.fizz.should == "Buzz"

    six = 6
    six.fizz.should == "Fizz"

    seven = 7
    seven.fizz.should == "7"

    fifteen = 15
    fifteen.fizz.should == "FizzBuzz"
  end
end
