# q6: How could the following method be simplified without changing its return value?

# def color_valid(color)
#   if color == "blue" || color == "green"
#     true
#   else
#     false
#   end
# end

def color_valid(color)
  color == "blue" || color == "green"
end

def color_valid(color)
  ["blue", "green"].include?(color)
end
