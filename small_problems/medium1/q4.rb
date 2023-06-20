# You have a bank of switches before you, numbered from 1 to n.
# Each switch is connected to exactly one light that is initially off.
# You walk down the row of switches and toggle every one of them.
# You go back to the beginning, and on this second pass,
# you toggle switches 2, 4, 6, and so on. On the third pass,
# you go back again to the beginning and toggle switches 3, 6, 9, and so on.
# You repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches,
# and returns an Array that identifies which lights are on after n repetitions.

# Example with n = 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4.
# The return value is [1, 4].

# With 10 lights, 3 lights are left on: lights 1, 4, and 9.
# The return value is [1, 4, 9].

def get_on_lights(n)
  lights = initialize_lights(n)
  print_lights_state(lights) unless n > 10

  1.upto(n) do |round|
    toggle_every_nth_light!(lights, round)
    print_lights_state(lights, round) unless n > 10
  end

  on_lights(lights)
end

def initialize_lights(n)
  lights = {}
  1.upto(n) { |position| lights[position] = false }
  lights
end

def toggle_every_nth_light!(lights, nth)
  lights.each { |position, state| lights[position] = !state if position % nth == 0  }
end

def on_lights(lights)
  lights.select { |_position, on| on }.keys
end

def off_lights(lights)
  lights.reject { |_position, on| on }.keys
end

def print_lights_state(lights, round = 0)
  if lights.values.all? { |on| on }
    puts "round #{round}: every light is turned on"
  elsif lights.values.none? { |on| on }
    puts "round #{round}: every light is turned off"
  else
    on_lights_str = format_lights_string(on_lights(lights))
    off_lights_str = format_lights_string(off_lights(lights))
    puts "round #{round}: #{off_lights_str} now off; #{on_lights_str} on"
  end
end

def format_lights_string(lights_array)
  case lights_array.size
  when 1 then "light #{lights_array[0]} is"
  when 2 then "lights #{lights_array.join(' and ')} are"
  else        "lights #{lights_array[0...-1].join(', ')}, and #{lights_array.last} are"
  end
end

p get_on_lights(5) # == [1, 4]
p get_on_lights(10) # == [1, 4, 9]
p get_on_lights(1000)
