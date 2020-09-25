# http://ruby.bastardsbook.com/chapters/collections/

# How you initialize an array:
my_first_array = []

# You can fill an array with any kind of data object:
my_first_array[0] = "Alpha"
my_first_array[1] = "Beta"
my_first_array[2] = 3

# Initializing and filling the array in one step:
my_first_array = ["Alpha", "Beta", 3]

# Elements in arrays are accessed by addressing their numeral place in the array:
puts my_first_array[1]

# 09-24-2020
arr = Array.new
arr = [1,2,3,4,5,6]

arr.each do | element |
    puts "I'm on element #{element}"
end

puts "my array is"
puts arr.join(", ")