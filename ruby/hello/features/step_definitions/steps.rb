Given(/^the program has finished$/) do
  @cucumber = `ruby hello.rb`
end

Then(/^the output is hello world$/) do
  @cucumber.should == 'Hello World!\n'
end
