# Write a method that returns the number of Friday the 13ths in the year given
# by an argument. You may assume that the year is greater than 1752
# (when the United Kingdom adopted the modern Gregorian Calendar)
# and that it will remain in use for the foreseeable future.

require 'date'

# def friday_13th(year)
#   friday_13th_count = 0
#   thirteenth = Date.new(year, 1, 13)

#   loop do
#     friday_13th_count += 1 if thirteenth.friday?
#     thirteenth = thirteenth.next_month
#     break if thirteenth.year != year
#   end
#   friday_13th_count
# end

# refactored
def friday_13th(year)
  (1..12).count { |month| Date.new(year, month, 13).friday? }
end

# Examples:
puts friday_13th(2015) == 3
puts friday_13th(1986) == 1
puts friday_13th(2019) == 2

# Further Exploration
def five_fridays(year)
  (1..12).count do |month|
    start_of_month = Date.new(year, month, 1)
    end_of_month = Date.new(year, month, -1)
    (start_of_month..end_of_month).count(&:friday?) == 5
  end
end

puts five_fridays(2020) == 4
puts five_fridays(2019) == 4
puts five_fridays(2016) == 5
puts five_fridays(2008) == 4
