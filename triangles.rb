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
