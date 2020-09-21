# Connie Huang
# 09-03-2020

# boolean for name change
isDone = false

until isDone == true

    # name inputs
    puts "Please enter your first name:"
    first_name = gets.chomp.capitalize
    puts "Please enter your last name:"
    last_name = gets.chomp.capitalize
    
    # name lengths
    first_length = first_name.length
    last_length = last_name.length
    total_length = first_length + last_length
    
    # system response
    puts "Your full name is #{first_name} #{last_name}."
    puts "Your first and last name are #{first_length} and #{last_length} characters long."
    puts "Together, your full name is #{total_length} characters long."
    
    # ask for name change
    puts "Would you like to enter your name in again? Please type in yes or no."
    answer = gets.chomp.downcase
    
    # repeat or end program
    if answer == "yes"
        isDone = false
    else
        puts "Program has ended."
        isDone = true
    end
    
end