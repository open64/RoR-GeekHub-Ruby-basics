arr = [621, 448, 147, 159, 430, 222, 482, 44, 194, 522,
       652, 494, 12, 126, 532, 387, 441, 471, 337, 446,
       18, 36, 202, 572, 556, 458, 16, 139, 222, 220,
       107, 82, 264, 366, 501, 319, 314, 430, 55, 300]
print arr, "\n"

# узнать количество элементов в массиве
puts arr.count
# перевернуть массив
print arr.reverse, "\n"
# найти наибольшее число
puts arr.max
# найти наименьшее число
puts arr.min

# найти среднее арифметическое
puts arr.reduce(:+) / arr.count.to_f
# отсортировать от меньшего к большему
print arr.sort, "\n"
# отсортировать от большего к меньшему
print arr.sort {|x, y| y <=> x}, "\n"

# удалить все нечетные числа
print arr.reject {|x| x % 2 == 1}, "\n"
# оставить только те числа, которые без остатка делятся на 3
print arr.reject  {|x| x % 3 != 0}, "\n"
# удалить из массива числа, которые повторяются (то есть, нужно вывести массив, в котором нет повторов)
print arr.uniq, "\n"
# разделить каждый элемент на 10, в результате элементы не должны быть округлены до целого
print arr.map {|x| x / 10}, "\n"
# получить новый массив, который бы содержал в себе те буквы английского алфавита, порядковый номер которых есть в нашем массиве
en = arr.select {|x| (65..90) === x or (97..122) === x}
en.each {|x| print x.chr, ' '}
puts

# поменять местами минимальный и максимальный элементы массива
max_index = arr.each_with_index.max[1]
min_index = arr.each_with_index.min[1]
arr_copy = arr.dup
arr_copy[min_index], arr_copy[max_index] = arr_copy[max_index], arr_copy[min_index]
print arr, "\n"

# найти элементы, которые находятся перед минимальным числом в массиве
print arr[0..min_index], "\n"
# необходимо найти три наименьших элемента
arr_copy = arr.dup
3.times do
  min_index = arr_copy.each_with_index.min[1]
  print arr_copy[min_index], ' '
  arr_copy.delete_at(min_index)
end

