print "Введите размер стороны треугольника 'a': "
a = gets.chomp.to_i

print "Введите размер стороны треугольника 'b': "
b = gets.chomp.to_i

print "Введите размер стороны треугольника 'c': "
c = gets.chomp.to_i

if a > b && a > c
	h = a
elsif b > a && b > c
	h = b
elsif c > a && c > b
	h = c
end

if a == b && b == c
	puts "Треугольник равнобедренный"
elsif (a == b && a != c) || (a == c && a != b) || (b == c && b != a)
	puts "Треугольник равносторонний"
elsif ((a == b && a != c) || (a == c && a != b) || (b == c && b != a)) && (h**2 == a**2 + b**2)
	puts "Треугольник прямоугольный и равносторонний"
elsif h**2 == a**2 + b**2
	puts "Треугольник  прямоугольный"
else
	puts "Треугольник ни равносторонний, ни равнобедренный, ни прямоугольный"
end