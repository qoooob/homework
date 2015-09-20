print "Как тебя зовут?"
first_name = gets.chomp
first_name.capitalize!

print "Какой твой рост?"
length = gets.to_i

puts " #{first_name}, твой идеальный вес: #{length - 100}"
