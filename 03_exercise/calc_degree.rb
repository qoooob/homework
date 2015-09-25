print "Введите число: "
a = gets.chomp.to_i
sum = 0
range = (1..a)

range.each do |i| 
	mult = i*i
	sum += mult
end
	puts "Сумма степеней до числа #{a} равна #{sum}"