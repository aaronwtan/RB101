# Rewrite your recursive fibonacci method so that it computes its results without recursion.

def fibonacci(nth)
  fib1, fib2 = [1, 1]

  3.upto(nth) do
    fib1, fib2 = [fib2, fib1 + fib2]
  end

  fib2
end

# Examples:
puts fibonacci(20) == 6765
puts fibonacci(100) == 354224848179261915075
puts fibonacci(100_001) # => 4202692702.....8285979669707537501


# Using fast doubling algorithm
def fibonacci_fast_doubling(n)
  return 1 if n <= 2

  nums = []
  while n > 0
    nums << n
    n /= 2
  end

  a = 0 # F(n)     = F(0)
  b = 1 # F(n + 1) = F(1)

  until nums.empty?
    n = nums.pop
    c = a * ((2 * b) - a) # c = F(2n)
    d = b**2 + a**2       # d = F(2n + 1)
    if n.odd?
      a = d
      b = c + d
    else
      a = c
      b = d
    end
  end
  a
end
puts fibonacci_fast_doubling(3_000_001)
