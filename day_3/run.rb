require_relative "panel.rb"

data = File.readlines("input.txt")

panel = Panel.new(data)
puts "Closest Distance: #{panel.closest_intersection_distance}"
puts "Closest Steps: #{panel.closest_intersection_steps}"

