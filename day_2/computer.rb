require "pry"

class Computer
  def run_program(data)
    self.data = data

    run!
  end

  def run!

  end

  def data=(data)
    if data.kind_of? String
      data = data.split(",")
    end
    unless data.kind_of?(Array)
      throw "Unsupported data type"
    end

    @data = data
  end

  def data
    @data.join(",")
  end
end

