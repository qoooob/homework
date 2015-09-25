print "Введите число дня недели от 1 до 7: "
weekday = gets.chomp.to_i

case weekday
	when weekday = 1
		puts "Понедельник"
	when weekday = 2
		puts "Вторник"
	when weekday = 3
		puts "Среда"
	when weekday = 4
		puts "Четверг"
	when weekday = 5
		puts "Пятница"
	when weekday = 6
		puts "Суббота"
	when weekday = 7
		puts "Воскресенье"
	else
		puts "Неверный день недели!"						
end