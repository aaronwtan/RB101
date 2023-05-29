# Write a method that takes two arguments: the first is the starting number,
# and the second is the ending number. Print out all numbers
# from the starting number to the ending number, except if a number is divisible
# by 3, print "Fizz", if a number is divisible by 5, print "Buzz",
# and finally if a number is divisible by 3 and 5, print "FizzBuzz".

def fizzbuzz(start_num, end_num)
  result = []
  start_num.upto(end_num) do |num|
    result << if num % 3 == 0 && num % 5 == 0
                'FizzBuzz'
              elsif num % 3 == 0
                'Fizz'
              elsif num % 5 == 0
                'Buzz'
              else
                num
              end
  end

  result.join(', ')
end

# Example:
puts fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
