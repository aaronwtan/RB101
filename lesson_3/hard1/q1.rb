# q1: What do you expect to happen when the greeting variable is referenced in the last line of the code below?

if false
  greeting = "hello world"
end

greeting

# greeting is initialized within the if statement, so it is in scope when it
# is referenced on the last line. Even though the conditional branch is never
# executed, greeting is still initialized with a value of nil
