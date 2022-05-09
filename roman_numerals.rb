def transform_to_nums
  num = 2398
  arr_num = num.digits.reverse
  
  arr_num.map!.with_index do |e, i|
    amount = arr_num.slice(i+1, num.size-1).size
    i == num.digits.size-1 ? e : (e.to_s + ('0' * amount)).to_i
  end
end

def transform_to_numerals(arr)
  results = []
  
  arr.each do |e|
    if e >= 1000
      results << 'M' * e.digits[-1]
    elsif e >= 500 == 0
      'D' * e.digits[-1]
    elsif e % 100 == 0
      'C' * e.digits[-1]
    elsif e % 50 == 0 # should capture part of 90
      'L' * e.digits[-1]
    elsif e % 10 == 0
      'X' * e.digits[-1]
    elsif e % 5 == 0
      'V' * e.digits[-1]
    else
      'I' * e.digits[-1]
    end
    
  end
  
  results
end

p transform_to_numerals(transform_to_nums) #== 'MMCCCXCVIII'
