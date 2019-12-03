masses = File.readlines("input.txt")

def calc_fuel(mass)
  fuel = mass.to_i / 3
  fuel = fuel.floor
  fuel - 2
end

def fuel_requirements(fuel_mass, memo = [])
  fuel_for_mass = calc_fuel(fuel_mass)

  if fuel_for_mass < 0
    memo.reduce(&:+)
  else
    memo << fuel_for_mass
    fuel_requirements(fuel_for_mass, memo)
  end
end

fuel_per_module = masses.map do |m|
  fuel = calc_fuel(m)
  fuel + fuel_requirements(fuel)
end

puts fuel_per_module.reduce(&:+)
