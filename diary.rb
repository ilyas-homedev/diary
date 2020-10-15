# Подсказка для пользователя
puts "Дневник открыт."
puts "Запись ведется до слова \"end\" в конце"
puts

# Определяем местоположение файла с программой
current_path = File.dirname(__FILE__)

# Условие, при котором пользователь постоянно вводит сколько угодно строк текста,
# которые сохраняются в переменную "line" и добавляются в массив "all_lines".
# Запись в массив заканчивается после введенного слова "end".
line = nil
all_lines = []

while line != "end" do
  line = STDIN.gets.chomp
  all_lines << line
end

# Определяем текущее время для имени файла "file_name" и заголовка отдельной записи
# в файле "time_string".
time = Time.now

file_name = time.strftime("%Y-%m-%d")
time_string = time.strftime("%H:%M")

separator = "___________________________________"

# Создаем отдельный файл относительно расположения файла программы с уже вышеустановленными
# именем файла и временем записи.
file = File.new(current_path + "/" + file_name + ".txt", "a")
file.print("\n\r" + time_string + "\n\r")

# Убираем слово "end" в конце каждой записи
all_lines.pop

# Вносим все записи пользователя из массива в вайл построчно с разделением линией "separator"
# и закрываем файл с записями
for item in all_lines do
  file.puts(item)
end

file.puts(separator)

file.close

# Подсказка для пользователя
puts "Ваша запись сохранена в файл #{file_name}.txt"
