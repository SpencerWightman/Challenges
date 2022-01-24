=begin

Write a program that, given a natural number and a set of one or more other numbers
can find the sum of all the multiples of the numbers in the set that are less than the first number.
If the set of numbers is not given, use a default set of 3 and 5.

Natural numbers up to, but not including, 20 that are multiples of either 3 or 5:
  3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.

=end

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