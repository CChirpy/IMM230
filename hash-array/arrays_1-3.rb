numbers = [1, 2, 3, 4, 5, 6]
numbers = [numbers[1], numbers[3], numbers[5]]

# Also possible, but not much better:
# second = numbers[1]
# fourth = numbers[3]
# sixth  = numbers[4]
# numbers = [second, fourth, sixth]

# In case you're curious, a way more elegant (and better) solution to this would be the following:
# numbers = numbers.select { |number| number.even? }

p numbers