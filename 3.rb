query = gets.chomp
while true
  if query == query.upcase
    if query == 'GOODBEY'
      break
    end
    puts 'NO, NEVER FROM ' + rand(1930..1950).to_s + ' YEAR!'
    query = gets.chomp
  else
    puts 'What?! SAY LOUDLY, GRANDSON!'
    query = gets.chomp
  end
end
