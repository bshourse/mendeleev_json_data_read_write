require 'json'

hash = {}
inner_hash = {}
puts "Какой элемент хотите добавить"
user_element = STDIN.gets.chomp
puts "Укажите название элемента"
element_name = STDIN.gets.chomp
puts "Укажите год открытия элемента"
element_year = STDIN.gets.chomp
puts "Укажите кто открыл элемент"
element_discoverer = STDIN.gets.chomp

#Создаем ассоциативный массив

inner_hash.store("name", element_name)
inner_hash.store("discoverer", element_discoverer)
inner_hash.store("year", element_year)

#Добавляем в хэш еще один хэш (струкута вида {a=>{b=>c}})

hash.store(user_element,inner_hash)

#Указываем путь где лежит json файл
current_path = File.dirname(__FILE__)
#Читаем файл
mendeleev_json = File.read(current_path + '/data/mendeleev.json', encoding: "UTF-8")
#Создаем хэш из файла используя класс JSON и сохраняем в переменную
existing_hash = JSON.parse(mendeleev_json)
# добавляем наш новый элемент таблицы менделеева(асоциативный массив) в текущий хэш
# который мы получили из существующего json файла
merged_hashes = existing_hash.merge(hash)
#записываем новую структуру в json файл
File.open(current_path + '/data/mendeleev.json', "w:UTF-8") do |f|
  f.puts JSON.pretty_generate(merged_hashes)
end

