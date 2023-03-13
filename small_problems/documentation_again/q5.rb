# What do each of these puts statements output?

a = %w(a b c d e)
puts a.fetch(7) # throws an IndexError exception
puts a.fetch(7, 'beats me') # outputs 'beats me'
puts a.fetch(7) { |index| index**2 } # outputs 49