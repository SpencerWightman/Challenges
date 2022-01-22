SCORES = {
  1 => ['a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't'],
  2 => ['d', 'g'],
  3 => ['b', 'c', 'm', 'p'],
  4 => ['f', 'h', 'v', 'w', 'y'],
  5 => ['k'],
  8 => ['j', 'x'],
  10 => ['q', 'z']
}

class Scrabble
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def score
    total = 0
    return total if input.nil?
    input.downcase.chars.each do |e|
      SCORES.each_pair { |k, v| total += k if v.include?(e) }
    end
    total
  end

  def self.score(input)
    total = 0
    return total if input.nil?
    input.downcase.chars.each do |e|
      SCORES.each_pair { |k, v| total += k if v.include?(e) }
    end
    total
  end
end
