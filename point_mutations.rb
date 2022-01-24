class DNA
  attr_reader :str1

  def initialize(strand)
    @str1 = strand
  end

  def hamming_distance(str2)
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