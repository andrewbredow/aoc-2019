min = 284639
max = 748759

def pairs(digits)
  comp = digits.clone.unshift nil
  comp.zip(digits).reject {|a| a.any?(&:nil?) }
end

def repeat_adjacent?(digits)
  pairs(digits).any? {|s| s.first == s.last }
end

def increasing?(digits)
  pairs(digits).all? {|s| s.first <= s.last }
end

possibilities = Range.new(min, max).select do |p|
  digits = p.digits.reverse
  repeat_adjacent?(digits) && increasing?(digits)
end

puts possibilities.length

