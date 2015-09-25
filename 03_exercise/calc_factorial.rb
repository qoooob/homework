print "Введите число: "
a = gets.chomp.to_i
range = (1..a)
fac = 1

range.each do |i| 
	fac *= i
end
	puts "Факториал числа #{a} равен: #{fac}"