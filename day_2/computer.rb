require "pry"

class Computer
  @position = 0

  def run_program(data)
    self.data = data

    run!
  end

  def run!
    

  end

  def data=(data)
    data = data.split(",")

    @data = data
  end

  def data
    @data.join(",")
  end
end

