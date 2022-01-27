=begin
# -------------------------------------- Problem ----------------------------
Goal
  Given letter, create a diamond shape

Rules
  The diamond must include all letters before given letter
  The diamond must begin and end with one 'A'
    Each other row must have 2 identical letters
  The middle letter must be the given letter
  Each element must be the same size (incuding spaces)

# -------------------------------------- Understand -------------------------
Model
  The size of each element doesn't change --> only where the letters are placed
  They start in the middle and move out 1 each time
  The middle row is always the row of the given letter's alphabet position
  It is sandwiched between two other blocks of 1 less size (4-5-4) which are even

Abstract
  Create the full empty rows, then insert the letters
  Find alpha position of letter (num)
  alpha = ('a'..letter).to_a
  size = alpha.size+(alpha.size-1)
  a = Array.new(size)
  a.map! {|e| " "*size}
  a[i][5] = 'A'

"A    "
" B   " => "   B ""B   "
"  C  " => "  C  "" C  "
"   D "
"    E"

# -------------------------------------- Slice ------------------------------

# -------------------------------------- Code -------------------------------
=end


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