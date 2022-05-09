require 'minitest/autorun'

class PerfectNumberTest < Minitest::Test
  def test_initialize_perfect_number
    assert_raises StandardError do
      PerfectNumber.classify(-1)
    end
  end

  def test_classify_deficient
    # skip
    assert_equal 'deficient', PerfectNumber.classify(13)
  end

  def test_classify_perfect
    # skip
    assert_equal 'perfect', PerfectNumber.classify(28)
  end

  def test_classify_abundant
    # skip
    assert_equal 'abundant', PerfectNumber.classify(12)
  end
end

# Solution

class PerfectNumber
  def self.classify(num)
    raise(StandardError) if num <= 0

    arr = (1...num).to_a.each_with_object([]) do |e, o|
      o << e if num % e == 0
    end.sum

    return 'perfect' if arr == num
    return 'abundant' if arr > num
    return 'deficient' if arr < num
  end
end
