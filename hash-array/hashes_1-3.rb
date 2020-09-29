dictionary = { :one => 'uno', :two => 'dos', :three => 'tres' }
dictionary[:four] = 'cuatro'
dictionary[:four] = dictionary[:four].capitalize
puts dictionary[:four]