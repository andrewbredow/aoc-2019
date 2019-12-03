require "minitest/autorun"
require_relative "panel.rb"

class PanelTest < MiniTest::Test
  def test_ex_one
    lines = [
      "R75,D30,R83,U83,L12,D49,R71,U7,L72",
      "U62,R66,U55,R34,D71,R55,D58,R83"
    ]

    panel = Panel.new(lines)
    assert_equal 159, panel.closest_intersection_distance
  end

  def test_ex_two
    lines = [
      "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51",
      "U98,R91,D20,R16,D67,R40,U7,R15,U6,R7"
    ]

    panel = Panel.new(lines)
    assert_equal 135, panel.closest_intersection_distance
  end
end
