
=begin
# -------------------------------------- Problem ----------------------------
Explicit
  Return: equilateral; isosceles; scalene

Rules
  Equilateral: 3 / 3 / 3
  Isosceles: 3 / 1 / 3
  Scalene: 1 / 2 / 3
  Sum of any 2 sides must be greater than any 1 side *
  No side can have a length of 0 *

# -------------------------------------- Understand -------------------------
Collect sums of all 2 pairs of nums. Determine if they are 1) all the same 2) there is a duplicate 3) all unique. 
Then, also that each is greater than each num in given array.

# -------------------------------------- Slice ------------------------------
(SIMPLIED FIRST STEP)
Given array of 3 nums
Iterate through array and return new array of sums of each unique pairing
  Nested iteration
    Next if indexes are the same
    Add each element to the other element

Return desired result based on the size of the sum array

# -------------------------------------- Code -------------------------------
=end

class Triangle
  attr_reader :arr

  def initialize(num1, num2, num3)
    @arr = [num1, num2, num3]
    raise ArgumentError if arr.any? { |e| e <= 0 }
    raise ArgumentError if arr.any? { |e, i| e >= (arr.sum - e) }
  end

  def kind
    return 'equilateral' if arr.uniq.size == 1
    return 'scalene' if arr.uniq.size == 3
    return 'isosceles' if arr.uniq.size == 2
  end

end