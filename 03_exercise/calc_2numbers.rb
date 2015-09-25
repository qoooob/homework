print "Введите число 'a': "
a = gets.chomp.to_i
print "Введите число 'b': "
b = gets.chomp.to_i

#проверка чисел
if a < b
	puts "Нужно, чтобы 'a', было больше 'b'. Попробуйте ещё раз!"
	exit
end

sum = 0
calc_num = 0
range = (1..a)

range.each do |i| 
	if i % b == 0
		sum += i
		calc_num += 1
	end
end
	puts "Сумма чисел равна #{sum}"
	puts "Cредне арефметическое чисел равно #{sum/calc_num}"