class Anagram
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def match(arr)
    sorted_given = string.downcase.chars.sort.join
    arr.each_with_object([]) do |e, o|
      o << e if e.downcase.chars.sort.join ==
                sorted_given && e.downcase != string.downcase
    end
  end
end
