print "Введите число: "
a = gets.chomp.to_f
sum = 0.0
range = (1..a)

for i in range 
	sum += i
end
	puts "Сумма равна #{sum}"
	puts "Cредне арефметическое равно #{sum/range.size}"