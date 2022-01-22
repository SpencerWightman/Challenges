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
