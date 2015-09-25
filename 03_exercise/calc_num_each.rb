print "Введите число: "
a = gets.chomp.to_f
sum = 0.0
range = (1..a)

range.each do |i| 
	sum += i
end
	puts "Сумма равна #{sum}"
	puts "Cредне арефметическое равно #{sum/range.size}"