#coding: utf-8
class Pets
	def initialize(name)
		@name = name
		@hp = 100
		@mood = 100
		@hunger = 0
		@tiredness = 0
		@power = 100
		@status = @@status[-1]
		@age = {year: 0, mount: 0, day: 0, hour: 0}
		@end = false
		@command = %w(feed play sleep feel help norm_day follow quit)
		@NUM_HP = rand(5..10)
		@NUM_HUNGER = rand(5..10)
		@NUM_POWER = rand(5..10)
	end

	# погодувать
	def feed
		p "Ви годуєте #{@name}"
		change_features(1, 2, -2, 1)
		p "#{@name} дуже сподобалось :)"
	end

	# прогулятися
	def walk(time)
		p 'Ви прогулюєтись ідучи на вулиці разом із своїм вихованцем'
		change_features(0, -1, -1, time)
	end

	# вкласти спати
	def go_to_sleep
		p "#{@name}пішов спати"
		p 'Він спить...'
		sleep(8)
		change_features(2, 2, 0, 8)
	end

	# поспостерігати
	def follow
		r = rand(1..5)
		case r
			when 1
				p "#{@name} почав бігати по кімнаті і випадково впав :("
				change_features(-1, -1, -0.5, 1, -3)
			when 2
				p "#{@name} побіг до подвір’я і знашов там тенісний м’чик, які недавно зник. Він дуже зрадів :)"
				change_features(0, -1, -0.5, 1, 3)
			when 3
				p "#{@name} грався на подвір’ї з тенісним м’ячом і зміг підкинути його так високо як ніколи ще :)"
				change_features(0, -1, -0.5, 1, 4)
			when 4
				p "#{@name} грався на подвір’ї з тенісним м’ячом і закинув його кущі :("
				change_features(0, -1, -0.5, 1, -3)
			when 5
				p "#{@name} зайшов на кухню і знайшов у смітнику недоїдений бутерброд. Він його з’їв :)"
				change_features(1, -1, 0.5, 1, 3)
		end
	end

	# викликати підказки команд
	def help
		s = '.'
		n = 10
		p @command[0].ljust(n, s) + 'погодувати свого вихованця'
		p @command[1].ljust(n, s) + 'погратись із вихованцем'
		p @command[2].ljust(n, s) + 'покласти його спати'
		p @command[3].ljust(n, s) + "запитати: 'Як ти себе почуваєш'"
		p @command[4].ljust(n, s) + 'показати всі команди для вихованця'
		p @command[5].ljust(n, s) + 'проводити звичайний день'
		p @command[6].ljust(n, s) + 'просто поспостерігати за вихованцем'
		p @command[7].ljust(n, s) + 'закінчити гру'
		p
	end

	# Функція моделює режим гри з тамагочі
	# в ній присутні свої команди, які можна віддавати тамагочі
	def play
		$count = 0
		@play_command = ['sit', 'stand up', 'down', 'run', 'bring ball', 'help', 'quit']
		def sit
			p "#{@name} сів"
			change_features(0, -0.3, -0.1)
			$count += 1
		end
		def stand_up
			p "#{@name} встав"
			change_features(0, -0.4, -0.2)
			$count += 1
		end
		def down
			p "#{@name} ліг"
			change_features(0, -0.2, -0.1)
			$count += 1
		end
		def run
			p "#{@name} побіг"
			change_features(0, -1, -0.4)
			$count += 2
		end
		def bring_ball
			p "#{@name} побіг за м’ячиком і приніс вам його"
			change_features(0, -1, -0.5)
			$count += 2
		end
		def help_play
			s = '.'
			n = 13
			p @play_command[0].ljust(n, s) + "команда: 'сидіти'"
			p @play_command[1].ljust(n, s) + "команда: 'стояти'"
			p @play_command[2].ljust(n, s) + "команда: 'лежати'"
			p @play_command[3].ljust(n, s) + "команда: 'біжи'"
			p @play_command[4].ljust(n, s) + "команда: 'принеси мені м’ячик'"
			p @play_command[5].ljust(n, s) + 'показати всі команди'
			p @play_command[6].ljust(n, s) + 'занчити гру'
			p
		end

		p "#{@name} хоче пограти з тобою:)"
		p 'Це команди для твого :'
		help_play
		p 'Скажи йому, що робити: '
		p
		while true
			comm = gets.chomp.downcase
			case comm
				when @play_command[0]
					sit
				when @play_command[1]
					stand_up
				when @play_command[2]
					down
				when @play_command[3]
					run
				when @play_command[4]
					bring_ball
				when @play_command[5]
					help_play
				when @play_command[6]
					break
				else
					p 'Що? Щось незрозумів. Скажи ще раз.'
			end
			p
			p 'Далі'
			p "Якщо тобі потрібна допомога скажи 'help'"
		end
		time = $count / 4
		if $count >= 8
			$count -= 8
		end
		change_features(-1, -1, time, time, 3)
	end

	# Функція виводить на екран усі характеристики тамагочі
	def what_is_your_mood
		p "Здоров’я: #{@hp}"
		p "Показник голоду: #{@hunger}"
		p "Показник настрою: #{@mood}"
		p "Сила: #{@power}"
		p "Показник втоми: #{@tiredness}"
		p "Статус: #{@status}"
		p "Він прожив з тобою #{@age}"
	end

	# звичайний день тамагочі
	def day_life
		change_features(0, -1, -1)
		add_day
	end

	attr_reader :end
	attr_reader :command

	private
	@@status = ['Я хочу тебе вбити', 'Я ненавиджу тебе', 'Ти набрид мені', 'Ти мені не подобаєшся',
				'Нормально', 'не погано', 'Все гаразд', 'Ти мені подобаєшся', 'Ти класний',
				'Ти найкращий', 'Я щасливий']

	# Функція додає один день до загального прожитого життя вихованця з вами
	def add_day
		day_in_mount = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
		if @age[:day] + 1 <= day_in_mount[@age[:mount]]
			@age[:day] += 1
		elsif (@age[:mount] == 2 and
			(@age[:year] % 4 == 0 and @age[:year] % 100 == 0 or @age[:year] % 400 != 0))
			@age[:day] = 29
		else
			@age[:day] = 1
			if @age[:mount] <= 12
				@age[:mount] += 1
			else
				@age[:mount] = 1
				@age[:year] += 1
			end
		end
	end

	# Функція змінює характеристики вихованця
	def change_features(hp, power, hunger, time = 0, mood = 0)
		@hp += hp * rand(@NUM_HP)
		if @hp > 100
			@hp = 100
		elsif @hp <= 0
			@hp = 0
			p "З різних причин #{@name} останнім часом дуже нездоровилось і тому він помер :("
			@end = true
		end
		@power += power * rand(@NUM_POWER)
		if @power > 100
			@power = 100
		elsif @power <= 0
			@power = 0
			p "З різних причин #{@name} останнім часом дуже знесилився і зараз не може навіть піднятися :("
			@end = true
		end
		@hunger += hunger * rand(@NUM_HUNGER)
		if @hunger < 0
			@hunger = 0
		elsif @hunger >= 100
			@hunger = 0
			p "З різних причин #{@name} останнім часом дуже зголоднів і зараз тепер ви для нього тільки здобич:("
			@end = true
		end
		@tiredness = 5 - @power / 20
		if @tiredness == 5
			p "#{@name} дуже втомився і більше не хоче нічого робити"
			@end = true
		end
		@mood += (@hp - (@tiredness + @hunger) / 2) / 10 + mood
		if @mood > 100
			@mood = 100
		elsif @mood <= 0
			p "З різних причин #{@name} останнім часом був дуже невеселим і зараз взагалі самотність,  будучи поряд з вами:("
			@end = true
		end
		add_hour(time)
	end

	# Функція додає n годин до загального прожитого життя вихованця з вами
	def add_hour(n)
		@age[:hour] += n
		if @age[:hour] >= 24
			add_day
			@age[:hour] %= 24
		end
	end
end

# Основна частина програми
p "Привіт!!! Це гра 'Тамагочі v0.0.1'"
print 'Ти хочеш пограти з нами в цю гру? [ТАК/ні]: '
answer = gets.chomp.downcase
while true
	if answer == '' or answer == 'так'
		pets_list = %w(Пес Кіт Дракон)
		p ':) Добре! Зараз ти повинен вибрати собі свого вихованця з даного переліку (введіть номер)'
		pets_list.length.times {|i| p (i + 1).to_s + ' ' + pets_list[i]}
		name_pet = gets.chomp.to_i
		while true
			case name_pet
				when 1
					my_pet = Pets.new(pets_list[0])
					break
				when 2
					my_pet = Pets.new(pets_list[1])
					break
				when 3
					my_pet = Pets.new(pets_list[2])
					break
				else
					p 'Щось не так, введіть ще раз'
					name_pet = gets.chomp.to_i
			end
		end
		p 'Не поганий вібір'
		sleep(3)
		p "Поздоровляю! Тепер в тебе є новий	 друг - #{pets_list[name_pet - 1]}"
		p 'Тепер ти можеш починати за ним доглядоти'
		p 'Скажи, що будемо робити'
		p "Якщо тобі потрібна допомога, скажи 'help'"
		command = gets.chomp.downcase
		#feed, play, sleep, feel, help, norm_day, follow
		while command != 'stop'
			case command
				when my_pet.command[0]
					my_pet.feed
				when my_pet.command[1]
					my_pet.play
				when my_pet.command[2]
					my_pet.go_to_sleep
				when my_pet.command[3]
					my_pet.what_is_your_mood
				when my_pet.command[4]
					my_pet.help
				when my_pet.command[5]
					my_pet.day_life
				when my_pet.command[6]
					my_pet.follow
				when my_pet.command[7]
					break
				else
					p 'Не зрозумів. Повтори ще раз.'
			end
			if my_pet.end
				break
			end
			p 'Добре, наступна команда'
			p "Якщо тобі потрібна допомога, скажи 'help'"
			command = gets.chomp.downcase
		end
		p 'Добре, подивимось чого ти досяг:'
		my_pet.what_is_your_mood
		p 'Це все. Бувай.'
		break
	elsif answer == 'ні'
		p 'Добре, тоді це все.'
		p 'Бувай.'
		break
	else
		p 'Що? Будь ласка, скажи ще раз.'
		print 'Ти хочеш пограти з нами в цю гру? [ТАК/ні]: '
		answer = gets.chomp.downcase
	end
end

