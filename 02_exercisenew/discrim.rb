print "Введите коэффициент a вашего квадратного уравнения: "
a = gets.chomp.to_f
print "Введите коэффициент b вашего квадратного уравнения: "
b = gets.chomp.to_f
print "Введите коэффициент c вашего квадратного уравнения: "
c = gets.chomp.to_f

d = b**2 - 4*a*c

if d > 0
	x1 = -b + Math.sqrt(d)/2*a
	x2 = -b - Math.sqrt(d)/2*a
	puts "Дискриминант равен #{d}, корень x1 = #{x1}, корень x2 = #{x2}"
elsif d == 0
	x1 = -b/2*a
	puts "Дискриминант равен #{d}, корень x1 = x2 = #{x1}"
else 
	puts "Дискриминант равен #{d}, корней нет!"
end