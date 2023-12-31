# If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

# Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

# Note that you do not have to handle multiple 0s.

=begin
---Problem---
input = integer
output = integer
-rules-
explicit - must return max rotations
implicit - leading zeroes get dropped

---Data Structures ---
input = integer
output = integer
intermediate = array

----Algorithm---
High level - convert integer to an array, and iterate through array, moving each element to the end. convert back to an integer and return
1. define a method that takes an integer
  1. convert integer to a string, then to an array
  2. iterate through the array
    1. remove  the current element and append to the end
  3. convert array back to string, then to integer
end

=end

def max_rotation(integer)
  array = integer.to_s.chars
  array.each_with_index do |num, index|
    array << array.delete_at(index)
  end
integer = array.join.to_i
end



p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845