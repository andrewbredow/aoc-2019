require_relative "computer.rb"

computer = Computer.new
data = File.read("./input.txt")

## Set initial data
computer.data = data

## Update default state to pre-crash data
computer.set_value_at(1, 12)
computer.set_value_at(2, 2)

computer.run!

if computer.overflow?
  throw "Overflow condition"
end
unless computer.halted?
  throw "Improper program"
end

puts computer.value_at(0)
