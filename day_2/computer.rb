class Computer

  def run_program(data)
    @data = prep_data(data)
    @position = 0
    @halted = false
    @overflow = false

    run!
  end

  def run!
    return if halted? || overflow?

    case opcode
      when 1 then add
      when 2 then multiply
      when 99 then halt
    end

    advance!
    run!
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

  def multiply
    factors = []
    factors << value_at(peek(1))
    factors << value_at(peek(2))
    set_value_at(peek(3), factors.reduce(&:*))
  end

  def halt
    @halted = true
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
    @overflow = true if peek(3).nil? && opcode < 99
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

