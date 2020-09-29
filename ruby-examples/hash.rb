dictionary = { :one => 'uno', :two => 'dos', :three => 'tres', :four => 'cuatro' }
dictionary[:four] = 'cuatro'
puts dictionary[:four]

restaurant_menu = { "Ramen" => 3, "Dal Makhani" => 4, "Coffee" => 5 }
restaurant_menu.each do | item, price |
    puts "#{item}: $#{price}"
end