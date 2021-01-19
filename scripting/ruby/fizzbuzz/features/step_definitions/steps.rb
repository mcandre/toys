Given(/^the program has finished$/) do
    @cucumber = `ruby fizzy.rb`
end

Then(/^the output is FizzBuzz$/) do
    lines = @cucumber.lines

    1.upto(100).each do |i|
        line = lines[i - 1].chop

        if i % 3 == 0 && i % 5 == 0
            expect(line).to eq('FizzBuzz')
        elsif i % 3 == 0
            expect(line).to eq('Fizz')
        elsif i % 5 == 0
            expect(line).to eq('Buzz')
        else
            expect(line).to eq(i.to_s)
        end
    end
end
