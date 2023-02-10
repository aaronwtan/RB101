Q2: Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

what is != and where should you use it?
# != means 'not equal to' and is used in a conditional

put ! before something, like !user_name
# if '!' is placed before something, it is an operator that negates its operand, turning true or truthy values to false,
# and turning false or falsy values to true

put ! after something, like words.uniq!
# here the '!' indicates that the method will probably mutate its caller

put ? before something
# if '?' is placed before something, it is a ternary operator, where the expression before the '?' is a boolean,
# and two expressions after the '?' are the statements that should be evaluated depending on whether the boolean
# is true or false

put ? after something
# a '?' after something indicates it is probably a predicate or boolean method, which returns a boolean

put !! before something, like !!user_name
# '!!' is a double negation that can be useful for determining the boolean equilvalent of a truthy or falsy expression