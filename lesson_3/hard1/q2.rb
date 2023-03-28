# q2: What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings # = > { a: 'hi there'}

# informal_greeting points to the object that is the value of the key :a in greetings
# when this object is mutated, the original object in greetings will also be modified
