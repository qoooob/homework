array = (10..100).to_a
destination = []
array.each do |i|
	destination << i if i % 5 == 0
end

puts "#{destination}"