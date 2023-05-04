# You are given a method named spin_me that takes a string
# as an argument and returns a string that contains the same words,
# but with each word's characters reversed. Given the method's implementation,
# will the returned string be the same object as the one passed
# in as an argument or a different object?

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"

# The returned string is a different object. When String#split is invoked by
# the passed string object, the method returns a new array with substring elements.
# Elements of this new array are being operated on and mutated, but the original
# string is preserved. Array#join further returns another new string object
