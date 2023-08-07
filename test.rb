def mutating_delete(arr)
  arr.pop
  arr
end

arr = [1, 2, 3]

p mutating_delete(arr) == [1, 2] #=> true
p arr == [1, 2] #=> true

def non_mutating_delete(arr)
  arr[0..-2]
end

arr = [1, 2, 3]

p non_mutating_delete(arr) == [1, 2] #=> true
p arr == [1, 2, 3] #=> true