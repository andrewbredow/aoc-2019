require_relative "computer.rb"

data = File.read("./input.txt")
nouns = (1..99).to_a
verbs = (1..99).to_a

nouns.product(verbs).each do |noun, verb|
  computer = Computer.new
  computer.data = data

  computer.set_value_at(1, noun)
  computer.set_value_at(2, verb)

  computer.run!

  result = computer.value_at(0)

  if result == 19690720
    puts "\n\n"
    puts "Noun: #{noun}"
    puts "Verb: #{verb}"
    puts "Result: #{(100 * noun) + verb}"
  end
end



