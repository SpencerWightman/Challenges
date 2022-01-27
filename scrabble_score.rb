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

# class Scrabble
#   attr_reader :word

#   POINTS = {
#     'AEIOULNRST'=> 1,
#     'DG' => 2,
#     'BCMP' => 3,
#     'FHVWY' => 4,
#     'K' => 5,
#     'JX' => 8,
#     'QZ' => 10
# }
#   def initialize(word)
#     @word = word ? word : ''
#   end

#   def score
#     letters = word.upcase.gsub(/[^A-Z]/, '').chars

#     total = 0
#     letters.each do |letter|
#       POINTS.each do |all_letters, point|
#         total += point if all_letters.include?(letter)
#       end
#     end
#     total
#   end

#   def self.score(word)
#     Scrabble.new(word).score
#   end
# end