# Write a method that implements a miniature stack-and-register-based programming language
# that has the following commands:

# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value,
#     storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value,
#     storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value,
#      storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value,
#     storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value,
#     storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value
# All operations are integer operations (which is only important with DIV and MOD).

# Programs will be supplied to your language method via a string passed in as an argument.
# Your program may assume that all programs are correct programs; that is,
# they won't do anything like try to pop a non-existent value from the stack,
# and they won't contain unknown tokens.

# You should initialize the register to 0.

def minilang(program)
  stack = []
  register = 0
  tokens = program.split

  tokens.each do |token|
    return puts "ERROR: #{token} is not a valid token" unless valid_token?(token)
    return puts "ERROR: Empty stack" if stack.empty? && %w(ADD SUB MULT DIV MOD POP).include?(token)

    stack, register = execute_command(token, stack, register)
  end
  nil
end

def execute_command(token, stack, register)
  case token
  when 'PUSH'  then stack.push(register)
  when 'ADD'   then register += stack.pop
  when 'SUB'   then register -= stack.pop
  when 'MULT'  then register *= stack.pop
  when 'DIV'   then register /= stack.pop
  when 'MOD'   then register %= stack.pop
  when 'POP'   then register = stack.pop
  when 'PRINT' then puts register
  else              register = token.to_i
  end

  [stack, register]
end

def valid_token?(token)
  %w(PUSH ADD SUB MULT DIV MOD POP PRINT).include?(token) || token.to_i.to_s == token
end

# Examples:
minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)

# Further Exploration
# Write a minilang program to evaluate and print the result of this expression:
# (3 + (4 * 5) - 7) / (5 % 3)

# The answer should be 8.
minilang('3 PUSH 5 MOD PUSH 7 PUSH 3 PUSH 5 PUSH 4 MULT ADD SUB DIV PRINT')

# error handling
# empty stack
minilang('5 PUSH 3 MULT PRINT POP')

# invalid token
minilang('5 PUSH 3 MULTI PRINT')
