require "pry"
min = 284639
max = 748759

def pairs(digits)
  comp = digits.clone.unshift nil
  comp.zip(digits).reject {|a| a.any?(&:nil?) }
end

def repeating_pairs(digits)
  g = []
  current_group = 0
  digits.each do |d|
    if g[current_group]
      unless g[current_group].last == d
        current_group += 1
      end
    end
    g[current_group] ||= []
    g[current_group] << d
  end
  g.reject {|group| group.length != 2 }
end

def repeat_adjacent?(digits)
  repeating_pairs(digits).any?
end

def increasing?(digits)
  pairs(digits).all? {|s| s.first <= s.last }
end

possibilities = Range.new(min, max).select do |p|
  digits = p.digits.reverse
  repeat_adjacent?(digits) && increasing?(digits)
end

puts possibilities.length
