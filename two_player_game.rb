class Player

  attr_accessor :name, :lives
  def initialize(name)
    @name = name
    @lives = 3
  end

  def alive?
    @lives > 0
  end 

end

class Game 

  attr_accessor :player1, :player2, :players
  
  def initialize
    @players = []
    
    puts "Player 1: Enter your name"
    @player1 = Player.new(gets.chomp)

    puts "Your turn, Player 2: Enter your name"
    @player2 = Player.new(gets.chomp)

    players.push(@player1, @player2)
  end

  def generate_question
    Questions.new
  end
  
  def play

    puts "Ready to answer some math questions?"

      @players.cycle do |player| 
        
        puts "#{player.name}:"
        question = self.generate_question
        puts question.show
        print "> "
        answer = gets.chomp

        if answer.to_i == question.correct_answer
          puts "#{player.name}: CORRECT! You may advance to the next round"
          puts "#{player.name}: Lives remaining #{player.lives}"
        else
        
            player.lives -= 1 
            puts "WRONG!"
            puts "#{player.name}: Lives remaining #{player.lives}"
            puts "---NEW TURN---"

            if player.lives == 0 
              puts "uh oh...#{player.name}..."
              puts "---GAME OVER---"
              break
            end
        end 
      end 
    end
  end


class Questions
  attr_accessor :correct_answer, :show
  def initialize
    @number1 = rand(1...20)
    @number2 = rand(1...20)
    @correct_answer = @number1 + @number2
    @show = "What is #{@number1} + #{@number2}?"  
  end 
end  

start = Game.new

start.play
