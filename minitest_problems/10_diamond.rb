require 'minitest/autorun'

class DiamondTest < Minitest::Test
  def test_letter_a
    answer = Diamond.make_diamond('A')
    assert_equal "A\n", answer
  end

  def test_letter_b
    #skip
    answer = Diamond.make_diamond('B')
    assert_equal " A \nB B\n A \n", answer
  end

  def test_letter_c
    #skip
    answer = Diamond.make_diamond('C')
    string = "  A  \n"\
             " B B \n"\
             "C   C\n"\
             " B B \n"\
             "  A  \n"
    assert_equal string, answer
  end

  def test_letter_e
    #skip
    answer = Diamond.make_diamond('E')
    string = "    A    \n"\
             "   B B   \n"\
             "  C   C  \n"\
             " D     D \n"\
             "E       E\n"\
             " D     D \n"\
             "  C   C  \n"\
             "   B B   \n"\
             "    A    \n"
    assert_equal string, answer
  end
end

# Solution

class Diamond
  def self.make_diamond(letter)
    find_size(letter)
    self.first_section
    self.second_section
    self.third_section
    @@arr.map!{|e| e.join + "\n"}.join
  end

#   def self.format
#     <<-DIAMOND
# #{0.upto(@@arr.size-1) do |i|
#     @@arr[i].join
#   end}
#     DIAMOND
#   end

  def self.first_section
    @@alpha.each_with_index do |e, i|
      @@arr[i][i] = e
    end
  end

  def self.second_section
    @@arr.map! do |e|
      e.reverse + e.slice(1..@@size)
    end
  end

  def self.third_section
    @@arr = @@arr + @@arr.reverse.slice(1..@@size)
  end

  def self.find_size(letter)
    @@alpha = ('A'..letter).to_a
    @@size = @@alpha.size
    @@arr = Array.new(@@size)
    @@arr.map! {|e| " "*@@size}
    @@arr.map! {|e| e.chars}
  end
end
