require "pry"

class Computer

  def run_program(data)
    @data = prep_data(data)
    @position = 0
    @halted = false
    @overflow = false

    run!
  end

  def run!
    case opcode
      when 1; add
    end

    advance!

    run! unless halted? || overflow?
  end

  def opcode
    @data[@position]
  end

  def add
    addends = []
    addends << value_at(peek(1))
    addends << value_at(peek(2))
    set_value_at(peek(3), addends.reduce(&:+))
  end

  def value_at(index)
    @data[index]
  end

  def set_value_at(index, value)
    @data[index] = value
  end

  def peek(n)
    @data[@position + n]
  end

  def advance!
    return if halted?

    @position += 4
    @overflow = true if peek(3).nil?
  end

  def prep_data(data)
    data.split(",").map(&:to_i)
  end

  def data
    @data.join(",")
  end

  def halted?
    !! @halted
  end

  def overflow?
    !! @overflow
 end
end

