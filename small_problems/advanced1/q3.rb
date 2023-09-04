# Write a method that takes a 3 x 3 matrix in Array of Arrays format
# and returns the transpose of the original matrix.

def transpose(matrix)
  result = []

  # row1 = [matrix[0][0], matrix[1][0], matrix[2][0]]
  # row2 = [matrix[0][1], matrix[1][1], matrix[2][1]]
  # row3 = [matrix[0][2], matrix[1][2], matrix[2][2]]

  (0..matrix.size - 1).each do |column_ind|
    transposed_row = (0..matrix.size - 1).map { |row_ind| matrix[row_ind][column_ind] }
    result << transposed_row
  end

  result
end

# Examples:
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# Further Exploration
def transpose!(matrix)
  (0..matrix.size - 1).each do |row_ind|
    (0..matrix.size - 1).each do |column_ind|
      if column_ind > row_ind
        matrix[row_ind][column_ind], matrix[column_ind][row_ind] = matrix[column_ind][row_ind], matrix[row_ind][column_ind]
      end
    end
  end
end

# Examples:
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

transpose!(matrix)

p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
