require 'minitest/autorun'

class SumTest < Minitest::Test
  def test_sum_to_1
    assert_equal 0, SumOfMultiples.to(1)
  end

  def test_sum_to_3
    # skip
    assert_equal 3, SumOfMultiples.to(4)
  end

  def test_sum_to_10
    # skip
    assert_equal 23, SumOfMultiples.to(10)
  end

  def test_sum_to_100
    # skip
    assert_equal 2_318, SumOfMultiples.to(100)
  end

  def test_sum_to_1000
    # skip
    assert_equal 233_168, SumOfMultiples.to(1000)
  end

  def test_configurable_7_13_17_to_20
    # skip
    assert_equal 51, SumOfMultiples.new(7, 13, 17).to(20)
  end

  def test_configurable_4_6_to_15
    # skip
    assert_equal 30, SumOfMultiples.new(4, 6).to(15)
  end

  def test_configurable_5_6_8_to_150
    # skip
    assert_equal 4419, SumOfMultiples.new(5, 6, 8).to(150)
  end

  def test_configurable_43_47_to_10000
    # skip
    assert_equal 2_203_160, SumOfMultiples.new(43, 47).to(10_000)
  end
end

# Solution

class SumOfMultiples
  attr_reader :min, :nums

  def initialize(*nums)
    @min = nums.min
    @nums = nums
  end

  def to(max)
    arr = (min...max).to_a
    arr.each_with_object([]) do |e, o|
      nums.each do |ee|
        next if o.include?(e)
        o << e if e % ee == 0
      end
    end.sum
  end

  def self.to(num)
    (3...num).to_a.select { |e| e % 3 == 0 || e % 5 == 0 }.sum
  end
end

# class SumOfMultiples
#   attr_reader :multiples

#   def self.to(num)
#     SumOfMultiples.new().to(num)  # clean and clever
#   end

#   def initialize(*multiples)
#     @multiples = (multiples.size > 0) ? multiples : [3, 5];   # in case of no argument
#   end

#   def to(num)
#     (1...num).select do |current_num|
#       any_multiple?(current_num)        # helper method
#     end.sum
#   end

#   private

#   def any_multiple?(num)
#     multiples.any? do |multiple|    # stops when it finds one
#       (num % multiple).zero?
#     end
#   end
# end
