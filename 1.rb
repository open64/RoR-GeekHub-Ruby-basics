require 'date'
current_date = Time.now
sec = 1000000000

day = sec / (60 * 60 * 24)
quantity_year = day / 365
leap_year_counter = 0
birth_year = current_date.year - quantity_year
while birth_year <= current_date.year
  if birth_year%4==0 and birth_year%100!=0 or (birth_year%400==0)
    leap_year_counter += 1
    birth_year += 4
  else
    birth_year += 1
  end
end
day %= (365 * quantity_year + leap_year_counter)

puts 'quantity_year: ' + (quantity_year).to_s
puts 'mount: ' + (day / 30).to_s
puts 'day: ' + (day % 30).to_s
