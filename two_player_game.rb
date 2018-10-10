require "./players"
require "./questions"

class Game 

  attr_accessor :player1, :player2, :players
  
  def initialize
    @players = []
    
    puts "Player 1: Enter your name"
    @player1 = Player.new(gets.chomp)

    puts "Player 2: Enter your name"
    @player2 = Player.new(gets.chomp)

    players.push(@player1, @player2)
  end

  def generate_question
    Questions.new
  end
  
  def play

    puts "--BEGIN--"
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

start = Game.new

start.play
