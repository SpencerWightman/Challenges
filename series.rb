class Series
  attr_reader :input
  def initialize(str)
    @input = str.chars
  end

  def slices(num)
    raise ArgumentError if num > input.size
    result = []
    input.each_with_index do |e, i|
      break if input.slice(i...i + num).size < num
      result << input.slice(i...i + num)
    end

    result.map {|e| e.map{|e| e.to_i}}
  end
end
