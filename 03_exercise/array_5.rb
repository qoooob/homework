array = []
(10..100).each do |i|
	array << i if i % 5 == 0
end

puts "#{array}"