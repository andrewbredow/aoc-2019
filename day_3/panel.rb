require "pry"

class Panel
  def initialize(lines)
    instructions = lines.map {|l| l.split(",") }

    @lines = instructions.map {|i| Line.new(i) }
  end

  def closest_intersection_distance
    throw "WAT" if @lines.length > 2
    intersections = @lines.map(&:points).reduce(&:&)
    intersections.map {|p| p.map(&:abs).reduce(&:+)}.min
  end
end

class Line
  attr_accessor :points

  def initialize(instructions)
    @instructions = instructions
    @pencil = [0, 0]
    @points = []
    draw
  end

  def draw
    @instructions.each do |i|
      direction = i[0]
      distance = i[1..i.length-1].to_i
      draw_line(direction, distance)
    end
  end

  def draw_line(direction, distance)
    axis = ["U", "D"].include?(direction) ? :y : :x
    direction = ["D", "L"].include?(direction) ? :neg : :pos

    index = axis == :x ? 0 : 1
    delta = direction == :pos ? 1 : -1

    distance.times do
      ## Update our pencil position
      @pencil[index] += delta

      ## Add the current point to the points array
      @points << @pencil.clone
    end
  end
end
