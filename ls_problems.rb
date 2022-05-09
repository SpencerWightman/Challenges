
=begin
~ TA Questions: 1 - 9 ~
Find Missing Letter in Sequence               : Find number not included in complete array
Find Primes within Range                      : Increment sum if modulo zero against all numbers up to number (two start); push to hash if sum is one
Tally Indices of Letters                      : Create k/v pairs in iteration
Create Hashes from Array Elements             : Find the pattern, then loop with hash that resets to empty
Mutate Letter up Alphabet Position            : Exceptions or modulo array length
Sum Subsequence Integers to Target            : Find all subsequence sums
Indices of Integers that Add to Target        : Add integers, next if indices are the same
Sort Odd; Even Fixed                          : Select odd, sort, insert even into new array at index
Sum Letter Scores                             : Add to sum if letter included in a key

~ LS Questions: 21 - 23 ~
Reverse Without Reverse           : Pop elements into new array
Select if Fibonacci               : Run Fibonacci sequence up to target; check if it includes target
Check Palindrome Without Reverse  : Pop elements into new array, join; check if equals given string

~ Video Questions: 10 - 19 ~
Create String from Substring                    : Check if each substring added to itself can equal string
Find Letters Appearing in All Strings *         : Select letters that appear in all strings, changing them to "" during iteration (avoid too many)
Find Next Biggest Number of Same Digits         : Iterate the number until it's larger and both numbers sorted are the same
Find Largest Subsequence Sum                    : Sum each subsequence and select the largest
Find Longest Common Prefix *                    : Find substrings for one string; select ones in all strings (or remove ones not in all strings); return longest
                                                : Select letters that all strings have at same index
Substring in Both Strings                       : Check if any substrings equal each other
Substring Can Rearrange to Match Other String   : Check if letter counts in target string are less than or equal to counts in other string
Find Longest Palindrome                         : Find each palindrome substring, then return the longest
Find Index where Sums on Either Side is Equal   : Return index where sum of elements to its left and sum of elements to its right (including element at index) equal 
Return the Century With Suffix                  : Divide by 100 and + 1 unless only first number is non-zero (then just 100); add conditionals for suffix
=end

# ---------------------------------------- #1 ----------------------------------------

# Write a method that takes an array of consecutive (increasing) letters as input and that returns the missing letter in the array.

# def determine_missing_letter(arr)
#   alpha = (arr.first..arr.last).to_a
  
#   alpha.each do |e|
#     return e if !arr.include?(e)
#   end
  
# end

# p determine_missing_letter(['a','b','c','d','f']) == 'e' 
# p determine_missing_letter(['O','Q','R','S']) == 'P'
# p determine_missing_letter(["a","b","c","d","f"]) == "e"
# p determine_missing_letter(["O","Q","R","S"]) == "P"

# ---------------------------------------- #2 ----------------------------------------

# Write a method that takes two numbers. Return an array containing all primes between the two numbers (include the two given numbers in your answer if they are prime). Don't use Ruby's 'prime' class.

# def find_primes(int1, int2)
#   arr = (int1..int2).to_a
  
#   results = []
  
#   0.upto(arr.size-1) do |i|
#     sum = 0
#     2.upto(arr[i]) do |ii|
#       next if arr[i] == 1
#       sum += 1 if arr[i] % ii == 0
#     end
#     results << arr[i] if sum == 1
#   end
  
#   results
# end

# OR

# def find_primes(int1, int2)
#   arr = (int1..int2).to_a
  
#   results = []
  
#   arr.each do |e|
#     sum = 0
#     count = 2
#     until count > e
#       sum += 1 if e % count == 0
#       count += 1
#     end
#     results << e if sum == 1
#   end
  
#   p results
# end

# p find_primes(3, 10) == [3, 5, 7]
# p find_primes(11, 20) == [11, 13, 17, 19]
# p find_primes(100, 101) == [101]
# p find_primes(1, 100) == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
# p find_primes(1, 2) == [2]

# ---------------------------------------- #3 ----------------------------------------

# Write a function that maps a string into an array of name, string, and occupation pairs. Return an empty array if given an empty string.

# def organize(str)
#   return [] if str.empty?

#   arr = str.split(", ")
#   arb = []

#   loop do
#     hash = {}
#     hash[:name] = arr.shift
#     hash[:age] = arr.shift
#     hash[:occupation] = arr.shift
#     arb << hash
#     break if arr.empty?
#   end
#   
#   arb
# end

# p organize("John Mayer, 41, Singer, Emily Blunt, 36, Actor") == [ {:name=>"John Mayer", :age=>"41", :occupation=>"Singer"}, {:name=>"Emily Blunt", :age=>"36", :occupation=>"Actor"}]
# p organize("Conan O'Brien, 56, Talk Show Host, Anna Wintour, 69, Editor") == [ {:name=>"Conan O'Brien", :age=>"56", :occupation=>"Talk Show Host"}, {:name=>"Anna Wintour", :age=>"69", :occupation=>"Editor"}]
# p organize("") == []

# ---------------------------------------- #4 ----------------------------------------

# Given a word, create a hash which stores the indexes of each letter in an array.
# Make sure the letters are the keys.
# Make sure the letters are symbols.
# Make sure the indexes are stored in an array and those arrays are values.

# def map_letters(str)
  
#   hash = {}
  
#   str.each_char.with_index do |e, i| 
#     if hash.has_key?(e.to_sym)
#       hash[e.to_sym] << i
#     else
#       hash[e.to_sym] = [i]
#     end
#   end
    
#   hash
  
# end

# p map_letters("froggy") == { :f => [0], :r=>[1], :o=>[2], :g=>[3, 4], :y=>[5] }
# p map_letters("dodo") == { :d=>[0, 2], :o=>[1, 3] }
# p map_letters("grapes") == { :g=>[0], :r=>[1], :a=>[2], :p=>[3], :e=>[4], :s=>[5] }

# ---------------------------------------- #5 ----------------------------------------

# Have the method letter_changes(str) take the str parameter being passed and modify it using the following algorithm:
# Replace every letter in the string with the 3rd letter following it in the alphabet (ie. c becomes f, Z becomes C).
# Then return this modified string.

# def letter_changes(str)
  
#   str.each_char.map do |e|
#     if e.match?(/[a-w]/i)
#       (e.ord+3).chr
#     elsif e == "X"
#       "A"
#     elsif e == "Y"
#       "B"
#     elsif e == "Z"
#       "C"
#     elsif e == "x"
#       "a"
#     elsif e == "y"
#       "b"
#     elsif e == "z"
#       "c"
#     else
#       e
#     end
#   end.join
  
# end

# p letter_changes("this long cake@&") == "wklv orqj fdnh@&"
# p letter_changes("Road trip9") == "Urdg wuls9"
# p letter_changes("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
# p letter_changes('xyz') == ('abc')

# ---------------------------------------- #6 ----------------------------------------

# Given an array of n positive integers and a positive integers, find the minimal length of a contiguous subarray for which the sum >= s.
# If there isn't one, return 0 instead.

# def minSubLength(arr, target)
  
#   results = []
  
#   0.upto(arr.size-1) do |i|
#     0.upto(arr.size-1) do |ii|
#       results << arr[i..ii] if arr[i..ii].sum > target
#     end
#   end
  
#   return 0 if results.empty?
  
#   results.min_by(&:size).size
  
# end

# p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
# p minSubLength([1, 10, 5, 2, 7], 9) == 1
# p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
# p minSubLength([1, 2, 4], 8) == 0

# ---------------------------------------- #7 ----------------------------------------

# Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
# You may assume that each input would have exactly one solution, and you may not use the same element twice.
# You can return the answer in any order.

# def two_sum(arr, int)
  
#   results = []
  
#   middle = arr.size / 2
#   p middle
  
#   0.upto(middle) do |i|
#     (arr.size-1).downto(middle) do |ii|
#       next if i == ii
#       if arr[i] + arr[ii] == int
#         results << i
#         results << ii
#       end
#     end
#   end
    
#   p results
  
# end

# OR

# def two_sum(arr, int)
#   results = []
#   num.each_with_index do |e, i|
#     num.each_with_index do |e, i|
#       if e1 + e2 == int && i != ii
#         results << i
#         results << ii
#         return results
#       end
#     end
#   end
# end

# p two_sum([2, 11, 7, 15], 9) == [0, 2]
# p two_sum([3, 2, 4], 6) == [1, 2]
# p two_sum([3, 3], 6) == [0, 1]

# ---------------------------------------- #8 ----------------------------------------

# You will be given an array of numbers. 
# You have to sort the odd numbers in ascending order, while leaving the even numbers at their original positions.

# def sort_odd(num)
  
#   odd_sorted = num.select{|e| e.odd? }.sort
  
#   num.each_with_index do |e, i|
#     odd_sorted.insert(i, e) if e.even? 
#   end
  
#   p odd_sorted
  
# end

# p sort_odd([7, 1])  ==  [1, 7]
# p sort_odd([5, 8, 6, 3, 4])  ==  [3, 8, 6, 5, 4]
# p sort_odd([9, 8, 7, 6, 5, 4, 3, 2, 1, 0])  ==  [1, 8, 3, 6, 5, 4, 7, 2, 9, 0]

# ---------------------------------------- #9 ----------------------------------------

# Given a word, compute the Scrabble score for that word
# A, E, I, O, U, L, N, R, S, T = 1
# D, G = 2
# B, C, M, P = 3
# F, H, V, W, Y = 4
# K = 5
# J, X = 8
# Q, Z = 10

# def scrabble_score(str)
#   sum = 0

#   scores = { ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"] => 1, 
#              ["D", "G"] => 2,   
#              ["B", "C", "M", "P"] => 3, 
#              ["F", "H", "V", "W", "Y"] => 4, 
#              ["K"] => 5, 
#              ["J", "X"] => 8, 
#              ["Q", "Z"] => 10 }

#   str.chars.each do |e|
#     scores.each_key do |k|
#       sum += scores[k] if k.include?(e.upcase)
#     end
#   end

#   sum
# end

# p scrabble_score('a') == 1
# p scrabble_score('cabbage') == 14
# p scrabble_score('Cabbage') == 14
# p scrabble_score('zebra') == 16

# ---------------------------------------- #10 ----------------------------------------

# Given a non-empty string check if it can be constructed by taking a substring of it
# and appending multiple copies of the substring together. You may assume the given string consists of
# lowercase English letters only.

# def repeated_substring_pattern(str)
  
#   0.upto(str.size-2) do |i|
#     n = ""
#     loop do
#       n += str[0..i]
#       return true if n == str
#       break if n.size > str.size
#     end
#   end
  
#   false
# end

# p repeated_substring_pattern("abab") == true
# p repeated_substring_pattern("aba") == false
# p repeated_substring_pattern("aabaaba") == false
# p repeated_substring_pattern("abaababaab") == true
# p repeated_substring_pattern("abcabcabcabc") == true

# ---------------------------------------- #11 ----------------------------------------

# Given an array of strings made only from lowercase letters, 
# return an array of all characters that show up in all strings within the given array (including duplicates).
# For example, if a character occurs 3 times in all strings but not 4 times, you need to include that character three times in the final answer.

# def common_chars(arr)
  
#   chars = arr.shift.chars
  
#   chars.select do |char|
#     arr.all? {|word| word.sub!(char, "")}
#   end
  
# end

# p common_chars(["bella", "label", "roller"]) == ["e", "l", "l"]
# p common_chars(["cool", "lock", "cook"]) == ["c", "o"]
# p common_chars(["hello", "goodbye", "booya", "random"]) == ["o"]
# p common_chars(["aabbaaaa", "ccdddddd", "eeffee", "ggrrrrr", "yyyzzz"]) == []

# ---------------------------------------- #12 ----------------------------------------

# You have to create a method that takes a positive integer number 
# and returns the next bigger number formed by the same digits.

# def next_bigger_num(int)
  
#   results = int
  
#   loop do
#     results += 1
#     return results if results > int && results.digits.sort == int.digits.sort
#     break if results.digits.size > int.digits.size
#   end
#   -1
# end

# p next_bigger_num(9) == -1
# p next_bigger_num(12) == 21
# p next_bigger_num(513) == 531
# p next_bigger_num(2017) == 2071
# p next_bigger_num(111) == -1
# p next_bigger_num(531) == -1
# p next_bigger_num(123456789) == 123456798

# ---------------------------------------- #13 ----------------------------------------

# Find the maximum sum of a contiguous subsequence in an array of integers

# def max_sequence(arr)
  
#   results = []
  
#   0.upto(arr.size-1) do |i|
#     0.upto(arr.size-1) do |ii|
#       results << arr[i..ii].sum
#     end
#   end
  
#   return 0 if results.max == nil
  
#   results.max > 0 ? results.max : 0
# end

# p max_sequence([]) == 0
# p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
# p max_sequence([11]) == 11
# p max_sequence([-32]) == 0
# p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12

# ---------------------------------------- #14 ----------------------------------------

# Find the longest common prefix string amongst an array of strings
# If there is no common prefix, return an empty string

# def substrings(str)
#   substrings = []
  
#   0.upto(str.size-1) do |i|
#     0.upto(str.size-1) do |ii|
#       substrings << str[i..ii] 
#     end
#   end
#   substrings.delete_if(&:empty?)
# end

# def common_prefix(arr)
#   results = []
    
#   substrings(arr[0]).each do |e|
#     0.upto(arr.size-1) do |ii|
#       results << e if e.match?(arr[ii][0..e.size-1])
#     end
#   end
  
#   results.delete_if do |e|
#     e if results.count(e) < arr.size
#   end
  
#   return "" if results.empty?
  
#   results.max_by(&:length)
# end

# def common_prefix(array)
#   first_word = array.shift
#   result_string = ""
  
#   first_word.each_char.with_index do |char, idx|
#     if array.all? { |word| word[idx] == char }
#       result_string << char
#     end
#   end
  
#   result_string
# end

# p common_prefix(["flower", "flow", "flight"]) == "fl"
# p common_prefix(["dog", "racecar", "car"]) == ""
# p common_prefix(["interspecies", "interstellar", "interstate"]) == "inters"
# p common_prefix(["throne", "dungeon"]) == ""
# p common_prefix(["throne", "throne"]) == "throne"

# ---------------------------------------- #15 ----------------------------------------

# Find if there is a substring that appears in both strings
# You will return true if you find one, or false if you do not

# def substring_test(str1, str2)
#   str1_chars = str1.downcase.chars
#   str2_chars = str2.downcase.chars
#   str1_chars.each_with_index do |char1, idx1|
#     str2_chars.each_with_index do |char2, idx2|
#       return true if char1 == char2 && str1_chars[idx1 + 1] == str2_chars[idx2 + 1] && 
#       idx1 != (str1_chars.size - 1)
#     end
#   end
#   false
# end

# O R

# def find_all_substrings(string)
#   results = []
  
#   0.upto(string.length - 1) do |current_index|
#     current_index.upto(string.length - 1) do |second_index|
#       results << string[current_index..second_index]
#       end
#     end
#   p results
# end

# def substring_test(str1, str2)
#   find_all_substrings(str2).each do |e|
#     return true if str1.downcase.include?(e.downcase) && e.size > 1
#   end

#   false
# end

# p substring_test('Something', 'Home') == true
# p substring_test('Something', 'Fun') == false
# p substring_test('Something', '') == false
# p substring_test('', 'Something') == false
# p substring_test('BANANA', 'banana') == true #
# p substring_test('test', 'lllt') == false
# p substring_test('', '') == false
# p substring_test('1234567', '541265') == true
# p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true

# ---------------------------------------- #16 ----------------------------------------

# Given two strings, write a method that returns true
# if a portion of the str1 characters can be rearranged to match str2
# otherwise return false

# def scramble(str1, str2)
  
#   str1_deleted = (str1.chars.delete_if{|e| !str2.include?(e) }.sort).join.size
#   str2_deleted = (str2.chars.delete_if{|e| !str1.include?(e) }.sort).join.size
  
#   if str2_deleted < str2.size
#     return false
#   elsif str1_deleted >= str2_deleted
#     return true
#   end
  
#   false
# end

# OR

# def scramble(str1, str2)
#   result = []
#   str1_arr = str1.chars
#   str2_arr = str2.chars

#   str1_arr.each_with_index do |e, i|
#     str2_arr.each_with_index do |inner_e, outer_i|
#       result[outer_i] = e if e == inner_e unless result.count(e) == str1.count(e)
#     end
#   end
#   str2 == result.join
# end

# OR

# def scramble(str1, str2)
#   str2_chars = str2.chars
#   str2_chars.each do |char2|
#     return false if str2.count(char2) > str1.count(char2)
#   end
#   true
# end

# p scramble('javaass', 'jjss') == false
# p scramble('rkqodlw', 'world') == true
# p scramble('cedewaraaossoqqyt', 'codewars') == true
# p scramble('katas', 'steak') == false
# p scramble('scriptjava', 'javascript') == true
# p scramble('scriptingjava', 'javascript') == true

# ---------------------------------------- #17 ----------------------------------------

# Find the length of the longest substring in the given string
# that is the same in reverse

# def longest_palindrome(str)
  
#   results = []
  
#   0.upto(str.size-1) do |i|
#     0.upto(str.size-1) do |ii|
#       results << str[i..ii] if str[i..ii] == str[i..ii].reverse
#     end
#   end
  
#   results.max_by(&:length).size
# end

# p longest_palindrome("a") == 1
# p longest_palindrome("aa") == 2
# p longest_palindrome("baa") == 2
# p longest_palindrome("aab") == 2
# p longest_palindrome("baabcd") == 4
# p longest_palindrome("baablkj12345432133d") == 9

# ---------------------------------------- #18 ----------------------------------------

# Find an index where the sum of the integers to the left of the index
# is equal to the sum of the integers to the right of the index
# if none, return -1

# def find_even_index(arr)
    
#   0.upto(arr.size-1) do |i|
#     return i if arr[0..i].sum == arr[i..-1].sum
#   end
  
#   -1
# end

# p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
# p find_even_index([1, 100, 50, -51, 1, 1]) == 1
# p find_even_index([1, 2, 3, 4, 5, 6]) == -1
# p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
# p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
# p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
# p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3

# ---------------------------------------- #19 ----------------------------------------

# Write a method that takes an integer year and returns the century
# return value must be a number that ends with st, nd, rd, or th appropriately

# def century(num)
  
#   arr = num.digits.reverse

#   if arr.size == 1
#     century = "1"
#   else
#     if (arr[1]..arr[-1]).to_a.all?{|e| e == 0}
#       century = (num / 100).to_s
#     else
#       century = (num / 100 + 1).to_s
#     end
#   end
    
#   case
#     when century == "1"  then return century += "st"
#     when century == "12" then return century += "th"
#     when century == "13" then return century += "th"
#     when century == "11" then return century += "th"
#     when century == "12" then return century += "th"
#     when century == "13" then return century += "rd"
#     when century[-1] == "1" then return century += "st"
#     when century[-1] == "2" then return century += "nd"
#     when century[-1] == "3" then return century += "rd"
#     else
#       return century += "th"
#   end
# end

# OR

# def century(year)
#   century = year / 100 + 1
#   century -= 1 if year % 100 == 0
#   century.to_s + century_suffix(century)
# end

# def century_suffix(century)
#   return 'th' if [11, 12, 13].include?(century % 100)
#   last_digit = century % 10

#   case last_digit
#   when 1 then 'st'
#   when 2 then 'nd'
#   when 3 then 'rd'
#   else 'th'
#   end
# end

# p century(24) == '1st'
# p century(4) == '1st'
# p century(400) == '4th'
# p century(104) == '2nd'
# p century(299) == '3rd'
# p century(1078) == '11th'
# p century(1123) == '12th'
# p century(1244) == '13th'
# p century(2092) == '21st'
# p century(2134) == '22nd'

# ---------------------------------------- #20 ----------------------------------------

# Write a program that takes a word problem and returns the answer as an integer

# def solver(str)
#   str.delete!("?")
#   arr = str.split(" ")
  
#   operations = ["divided"]
  
#   integers = []
#   operation = ""
  
#   arr.each do |e|
#     if e.to_i.to_s == e
#       integers << e.to_i
#     elsif operations.include?(e)
#       operation = e
#     end
#   end
  
#   case operation
#   when "divided" then (integers[0] / integers[1])
#   end
  
# end

# p solver("What is 15 divided by 3?") == 5

# ---------------------------------------- #21 ----------------------------------------

# Reverse an array without using the built-in reverse method

# def reverser(arr)
  
#   arr.each.with_object([]) do |e, o|
#     o.unshift e
#   end
  
# end

# p reverser([1, 2, 3, 4, 5]) == [5, 4, 3, 2, 1]

# ---------------------------------------- #22 ----------------------------------------

# Select the element out of the array if its index is a fibonacci number

# def select_fibonacci(arr)
  
#   fibonacci_array = [1, 1]
#   until fibonacci_array.size == arr.size
#     fibonacci_array << fibonacci_array[-1] + fibonacci_array[-2]
#   end
  
#   arr.select.with_index do |e, i|
#     e if fibonacci_array.include?(i)
#   end
    
# end

# p select_fibonacci([123, 123, 37, 9, 2234, 234, 12, 9393, 1929]) == [123, 37, 9, 234, 1929]
# p select_fibonacci([73, 12, 5, 7, 8, 565, 234, 12]) == [12, 5, 7, 565]
# p select_fibonacci([00, 123, 6, 87, 24, 9293, 12, 123123, 123]) == [123, 6, 87, 9293, 123]

# ---------------------------------------- #23 ----------------------------------------

# Write a method to determine if a word is a palindrome, without using the reverse method

# def palindrome?(arr)
  
#   reverse = []
  
#   arr.each_char do |e, o|
#     reverse.unshift e
#   end
  
#   reverse.join == arr
# end

# p palindrome?("abacus") == false
# p palindrome?("zebrbez") == true
