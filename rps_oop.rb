class Player
  attr_accessor :choice, :name
  def initialize(name)
    @name = name
  end

  def choose
    begin
    @choice = gets.chomp.upcase
    end until Rock_Paper_Scissors::OPTIONS.keys.include?(choice)
    puts "\t\t#{name}, you chose #{Rock_Paper_Scissors::OPTIONS[@choice]}"
  end
end

class Computer
  attr_reader :choice
  def initialize
  end

  def choose
    @choice = Rock_Paper_Scissors::OPTIONS.keys.sample
    puts "\t\tThe computer chose #{Rock_Paper_Scissors::OPTIONS[@choice]}"
  end
end

class Rock_Paper_Scissors
  attr_accessor :name, :player
  attr_reader :computer

  OPTIONS = { 'P' => 'Paper', 'R' => 'Rock', 'S' => 'Scissors' }
  
  def initialize
    puts "\t\tLet's play Rock-Paper-Scissors!\n\t\tPlayer 1, Enter your name: "
    @name = gets.chomp.capitalize
    @player = Player.new(name)
    @computer = Computer.new
  end

  def play_again?
    puts "\t\tWould you like to play again?"
    response = gets.chomp.upcase
    if response.include? 'Y'
      game = Rock_Paper_Scissors.new
      game.run
    else
      puts "\t\tI'll take that as a no.. Thanks for playing!"
    end
  end

  def run
    puts "\t\tChoose one: (P/R/S)"
    player.choose
    computer.choose
    who_won?
    play_again?
  end

  def who_won?
    if player.choice == computer.choice
      puts "\t\tYou tied!"
    elsif ((player.choice == 'P') && (computer.choice == 'R'))
      puts "\t\tPaper Wraps Rock!\n You won!"
    elsif ((player.choice == 'P') && (computer.choice == 'S'))
      puts "\t\tScissors cut Paper!\nWomp! You lost!"
    elsif ((player.choice == 'R') && (computer.choice == 'P'))
      puts "\t\tPaper Wraps Rock!\nWomp! You lost!"
    elsif ((player.choice == 'R') && (computer.choice == 'S'))
      puts "\t\tRock Crushes Scissors!\n You won!"
    elsif ((player.choice == 'S') && (computer.choice == 'P'))
      puts "\t\tScissors Cut Paper!\n You won!"
    elsif ((player.choice == 'S') && (computer.choice == 'R'))
      puts "\t\tRock Crushes Scissors!\n Womp! You lost!"
    end
  end
end

game = Rock_Paper_Scissors.new
game.run
