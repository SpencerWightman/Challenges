
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class InvalidTriangle < StandardError; end

class Hamming
  
  def detect(str1, str2)
    smaller_str = ""
    larger_str = ""
    
    if str1.size > str2.size
      smaller_str = str2
      larger_str = str1
    else
      smaller_str = str1
      larger_str = str2
    end
    
    h_distance = 0
    
    smaller_str.each_char.with_index do |e, i|
      h_distance += 1 if e != larger_str.chars[i]
    end
    
    h_distance
  end
  
end

class HammingTest < MiniTest::Test
  attr_reader :hamming

  def setup
    @hamming = Hamming.new
  end

  def test_detect
    assert_equal 0, hamming.detect('abc', 'abc')
    assert_equal 0, hamming.detect('abc', 'abcd')
    assert_equal 1, hamming.detect('abcd', 'aec')
    assert_equal 1, hamming.detect('aec', 'abcd')
    assert_equal 2, hamming.detect('ahjd', 'abcd')
    assert_equal 0, hamming.detect('', '')
  end

end


