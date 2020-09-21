# Connie Huang
# 09-14-2020

# 1: get an input from the user
# 2: convert the input from a string to an integer, using x.to_i
puts "Enter in a number:"
x = gets.to_i

# 3: output "Big" if x is greater than 10
# 4: output "Small" if x is less than or equal to 10, but not negative
if x>=0
    if x<=10
        puts "Small"
    elsif x>10
        puts "Big"
    end
end

# 5: if x is greater than 14 but less than 100, and x is even, output "Dog"
# 5: if x is >=100 && <=1000, or odd, output "Elephant", otherwise "Bananas"
if x>14 && x<100 && x%2==0
    puts "Dog"
elsif x>=100 && x<=1000 || x%2==1
    puts "Elephant"
else
    puts "Bananas"
end