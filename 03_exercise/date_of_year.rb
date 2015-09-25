print "Введите число от 1 до 31 (день): "
day = gets.chomp.to_i

print "Введите число от 1 до 12 (месяц): "
month = gets.chomp.to_i

print "Введите число (год): "
year = gets.chomp.to_i

mon = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

#Определяем высокосный ли год
if year % 4 == 0
	mon[1] = 29
end

#Суммируем дни
sum = 0

for i in (1..month-1)
	sum += mon[i-1]
end

puts "Количество дней с начала года #{sum + day}"