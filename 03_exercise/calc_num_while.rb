print "Введите число: "
a = gets.chomp.to_f
sum = 0.0
range = (1..a).to_a
i = 0

while i < a do
	sum += range[i]
	i += 1
end
	puts "Сумма равна #{sum}"
	puts "Cредне арефметическое равно #{sum/range.size}"