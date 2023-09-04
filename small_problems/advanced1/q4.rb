# Modify your transpose method from the previous exercise so it works
# with any matrix with at least 1 row and 1 column.

def transpose(matrix)
  result = []

  (0...matrix[0].size).each do |column_ind|
    transposed_row = (0...matrix.size).map { |row_ind| matrix[row_ind][column_ind] }
    result << transposed_row
  end

  result
end

# Examples:
p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]
