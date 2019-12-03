require_relative "computer.rb"
require "minitest/autorun"

class ComputerTest < MiniTest::Test
  def setup
    @computer = Computer.new
  end

  def test_addition_operation
    data = "1,0,0,0,99"
    @computer.run_program(data)

    assert_equal "2,0,0,0,99", @computer.data
    assert_equal true, @computer.halted?
    assert_equal false, @computer.overflow?
  end

  def test_overflow
    data = "1,0,0,0,2"
    @computer.run_program(data)

    assert_equal "2,0,0,0,2", @computer.data
    assert_equal false, @computer.halted?
    assert_equal true, @computer.overflow?
  end

  def test_multiplication_operation
    data = "2,4,4,5,99,0"
    @computer.run_program(data)

    assert_equal "2,4,4,5,99,9801", @computer.data
    assert_equal true, @computer.halted?
    assert_equal false, @computer.overflow?
  end

  def test_program_halt
    data = "1,1,1,4,99,5,6,0,99"
    @computer.run_program(data)


    assert_equal "30,1,1,4,2,5,6,0,99", @computer.data
    assert_equal true, @computer.halted?
    assert_equal false, @computer.overflow?
  end
end
