print "Введите количество студентов в группе: "
stud = gets.chomp.to_i

stud_sum = (1..stud).to_a
mark_sum = []

stud_sum.each do |i|
	puts "Введите оценку для студента #{i} от 0 до 100:"
	mark = gets.chomp.to_i
	if mark <= 100
		mark_sum << mark
	else 
		puts "Вы ввели не корректную оценку, попробуйте снова!"
		exit
	end
end

sum = 0
calc_sum = 0

mark_sum.each do |i|
	sum += i
	calc_sum += 1
end
puts "Средняя оценка группы равна #{sum/calc_sum} баллам"