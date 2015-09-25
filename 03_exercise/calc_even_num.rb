print "Введите число: "
a = gets.chomp.to_i
sum = 0
calc_num = 0
range = (1..a)

range.each do |i| 
	if i % 2 == 0
		sum += i
		calc_num += 1
	end
end
	puts "Сумма чётных чисел равна #{sum}"
	puts "Cредне арефметическое чётных чисел равно #{sum/calc_num}"