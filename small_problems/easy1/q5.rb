# Write a method that will take a short line of text, and print it within a box.

def print_in_box(text)
  box_edge = "+#{'-' * (text.size + 2)}+"
  box_empty_line = "|#{' ' * (text.size + 2)}|"

  puts box_edge
  puts box_empty_line
  puts "| #{text} |"
  puts box_empty_line
  puts box_edge
end

# # Example:

print_in_box('To boldly go where no one has gone before.')
# # +--------------------------------------------+
# # |                                            |
# # | To boldly go where no one has gone before. |
# # |                                            |
# # +--------------------------------------------+

print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+

# You may assume that the input will always fit in your terminal window.

# Further Exploration

# Modify this method so it will truncate the message if it will be too wide
# to fit inside a standard terminal window (80 columns, including the sides of the box).
# For a real challenge, try word wrapping very long messages so they appear on multiple lines, but still within a box.

BOX_SIDES_LENGTH = 4
TRUNCATION_LENGTH = 3
MAX_TRUNCATED_TEXT_LENGTH = 80 - BOX_SIDES_LENGTH - TRUNCATION_LENGTH

def print_in_box2(text)
  text = text[0..MAX_TRUNCATED_TEXT_LENGTH - 1] + '...' if text.length > MAX_TRUNCATED_TEXT_LENGTH

  box_edge = "+#{'-' * (text.size + 2)}+"
  box_empty_line = "|#{' ' * (text.size + 2)}|"

  puts box_edge
  puts box_empty_line
  puts "| #{text} |"
  puts box_empty_line
  puts box_edge
end

print_in_box2('To boldly go where no one has gone before.')
print_in_box2('')
print_in_box2('To boldly go where no one has gone before. And this message is too long oh no')

# text wrapping long messages
BOX_SIDES_LENGTH = 4
MAX_TEXT_LENGTH = 80 - BOX_SIDES_LENGTH

def print_long_text_in_box(text)
  top_line, inner_line, bottom_line = create_borders(text)

  puts top_line
  puts inner_line
  print_wrapped_text(text)
  puts inner_line
  puts bottom_line
end

def create_borders(text)
  if text.length > MAX_TEXT_LENGTH
    top_line = "+#{'-' * (MAX_TEXT_LENGTH + 2)}+"
    inner_line = "|#{' ' * (MAX_TEXT_LENGTH + 2)}|"
  else
    top_line = "+#{'-' * (text.size + 2)}+"
    inner_line = "|#{' ' * (text.size + 2)}|"
  end
  bottom_line = top_line
  [top_line, inner_line, bottom_line]
end

def print_wrapped_text(text)
  if text.length > MAX_TEXT_LENGTH
    wrapped_text_lines = wrap_text(text)
    wrapped_text_lines.each { |wrapped_line| puts format("| %-76s |", wrapped_line) }
  else
    puts "| #{text} |"
  end
end

def wrap_text(text)
  text += ' '
  wrapped_text_lines = []
  i = 0

  while i < text.length - 1
    slice_length = text[i..i + MAX_TEXT_LENGTH].rindex(' ')
    wrapped_text_lines << text.slice(i, slice_length).strip
    i += slice_length
  end

  wrapped_text_lines
end

print_long_text_in_box('To boldly go where no one has gone before.')
print_long_text_in_box('')
print_long_text_in_box("To boldly go where no one has gone before. And this message is too long, but that's okay! " * 25)
print_long_text_in_box("Don't walk in front of me; I may not follow. Don't walk behind me; I may not lead. \
Walk beside me; just be my friend. - Albert Camus")
