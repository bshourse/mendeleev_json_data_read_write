require 'json'

current_path = File.dirname(__FILE__ )

file = File.read(current_path + '/data/mendeleev.json', encoding: "utf-8")

mendeleev_table = JSON.parse(file)

puts "Здравствуйте у нас всего: #{mendeleev_table.keys.size} элементов"
puts mendeleev_table.keys.join(', ')
puts "О каком элементе хотите узнать?"

user_input = STDIN.gets.chomp

if mendeleev_table.has_key?(user_input)
  element = mendeleev_table[user_input]
  puts "Порядковый номер: #{element["number"]}"
  puts "Название: #{element["name"]}"
  puts "Первооткрыватель : #{element["discoverer"]}, (#{element["year"]} году.)"
  puts "Плотность: #{element["density"]}"
else
  puts "К сожалению такого элемента у нас пока нет"
end


