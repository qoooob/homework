puts "Для окончания ввода товаров, введите слово 'стоп' в графе названия товаров"
shop_case = {}

loop do
	print "Введите название товара: "
	name = gets.chomp
	break if name == "стоп"
	print "Введите цену за единицу товара (руб):"
	price = gets.chomp.to_f
	print "Введите кол-во купленного товара:"
	sum = gets.chomp.to_f
	shop_case[name] = {price: price, sum: sum}
end

total = 0.0
shop_case.each do |key, value|
	total_item = value[:price] * value[:sum]
	puts "Товар #{key}. Цена за единицу: #{value[:price]} руб.. Количество товара: #{value[:sum]}. Стоимость: #{total_item} руб."
	total += total_item
end

puts "Итоговая сумма всех покупок: #{total} руб."