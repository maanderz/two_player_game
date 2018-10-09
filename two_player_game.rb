class Player

  attr_accessor :name, :lives, :score

  def initialize(name)
    @name = name
    @lives = 3
    @score = 0
  end

end

player1 = Player.new('Angie')
player2 = Player.new('Ardelia')

puts player1.score
puts player2.score