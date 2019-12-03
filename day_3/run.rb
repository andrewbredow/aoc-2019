require_relative "panel.rb"

data = File.readlines("input.txt")

panel = Panel.new(data)
puts panel.closest_intersection_distance
