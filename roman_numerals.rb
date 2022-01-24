
=begin
# -------------------------------------- Problem ----------------------------
Goal
  Convert modern number to its Roman numeral

Rules
  Express each digit separately starting with the left-most digit and skipping any     digit with a value of zero
  
  No need to be able to convert numbers larger than about 3000

# -------------------------------------- Understand -------------------------
Model
  1990=MCMXC
    1000=M
    900=CM
    90=XC
  
  2008=MMVIII
    2000=MM
    8=VIII
    
  22=XXII
    20=XX
    2=II
    
I=1  
V=5  
X=10  
L=50  
C=100  
D=500  
M=1000

Abstract
  Break given num into array of nums, then transform each num by adding as many zeros to it as there are nums left in the given num (next if num is 0)
  
  Create a constant hash with k/v of number to roman numeral
  
  Transform each element in this new array based on corresponding value in constant
  
  Join the array into a string

# -------------------------------------- Slice ------------------------------



# -------------------------------------- Code -------------------------------
=end

# one digit at a time to numeral
# transform to 90
# if 90 / __ > 0 then do it
# put into new array of all nums
# each of those nums turned into numeral, then joined

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

=begin

2398
  2000 => MM
  300 => CCC
  90 => XC
  8 => VIII
=end






