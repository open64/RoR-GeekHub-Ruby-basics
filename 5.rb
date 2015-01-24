class Magic_ball
  @@answers = ['It is certain', 'It is decidedly so', 'Without a doubt',
               'Yes - definitely', 'You may rely on it', 'As I see it, yes',
               'Most likely', 'Outlook good', 'Signs point to yes', 'Yes',
               'Reply hazy, try again', 'Ask again later', 'Better not tell you now',
               'Cannot predict now', 'Concentrate and ask again', "Don't count on it",
               'My reply is no', 'My sources say no', 'Outlook not so good', 'Very doubtful']
  def initialize
	  @ask = ''
  end
  def shake(ask)
    p 'Thinking...'
    sleep 3
	@ask = ask
	if @ask != ''
    	p @@answers[rand(@@answers.length - 1)]
	else
		p "You don't enter your question"
	end
  end
end

p 'Ask magic ball what you want'
ask = gets.chomp
a = Magic_ball.new
a.shake(ask)