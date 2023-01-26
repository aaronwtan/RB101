# Command line calculator program that does the following:

# ask the user for two numbers
# ask the user for the type of operation to perform: add, subtract, multiply or divide
# perform the operation on the two numbers
# displays the result

# answer = Kernel.gets()
# Kernel.puts(answer)

Kernel.puts("Welcome to Calculator!")

Kernel.puts("What's the first number?")
number1 = Kernel.gets().chomp()

Kernel.puts("What's the second number?")
number2 = Kernel.gets().chomp()

Kernel.puts("What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide")
operator = Kernel.gets().chomp()

result = case operator
         when '1' then number1.to_i() + number2.to_i()
         when '2' then number1.to_i() - number2.to_i()
         when '3' then number1.to_i() * number2.to_i()
         when '4' then number1.to_f() / number2.to_f()
         end

Kernel.puts("The result is #{result}")