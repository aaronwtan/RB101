# Write a method that takes a floating point number that represents
# an angle between 0 and 360 degrees and returns a String
# that represents that angle in degrees, minutes and seconds.
# You should use a degree symbol (°) to represent degrees,
# a single quote (') to represent minutes, and a double quote (")
# to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = SECONDS_PER_MINUTE * MINUTES_PER_DEGREE

def dms(angle)
  total_seconds = angle * SECONDS_PER_DEGREE
  minutes, seconds = total_seconds.divmod(SECONDS_PER_MINUTE)
  degrees, minutes = minutes.divmod(MINUTES_PER_DEGREE)

  format(%(#{degrees}#{DEGREE}%.2d'%.2d"), minutes, seconds)
end

# Examples:

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# Further Exploration

# Our solution returns the following results for inputs outside the range 0-360:

# dms(400) == %(400°00'00")
# dms(-40) == %(-40°00'00")
# dms(-420) == %(-420°00'00")

# Since degrees are normally restricted to the range 0-360,
# can you modify the code so it returns a value
# in the appropriate range when the input is less than 0 or greater than 360?

DEGREES_PER_ROTATION = 360

def normalize_angle(angle)
  angle += DEGREES_PER_ROTATION while angle.negative?
  angle % DEGREES_PER_ROTATION
end

def dms2(angle)
  angle = normalize_angle(angle)
  total_seconds = angle * SECONDS_PER_DEGREE
  minutes, seconds = total_seconds.divmod(SECONDS_PER_MINUTE)
  degrees, minutes = minutes.divmod(MINUTES_PER_DEGREE)

  format(%(#{degrees}#{DEGREE}%.2d'%.2d"), minutes, seconds)
end

dms2(400) == %(40°00'00")
dms2(-40) == %(320°00'00")
dms2(-420) == %(300°00'00")
