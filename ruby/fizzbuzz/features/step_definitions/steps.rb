Given(/^the program has finished$/) do
  @cucumber = `ruby fizzy.rb`
end

Then(/^the output is FizzBuzz$/) do
  lines = @cucumber.lines

  1.upto(100).each do |i|
    line = lines[i - 1].chop

    if i % 3 == 0 && i % 5 == 0
      line.should == 'FizzBuzz'
    elsif i % 3 == 0
      line.should == 'Fizz'
    elsif i % 5 == 0
      line.should == 'Buzz'
    else
      line.should == i.to_s
    end
  end
end
