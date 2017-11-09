require_relative 'player'
#game class with attack method
class Game

  attr_reader :player1, :player2

  def initialize(player1,player2)
    @player1 = player1
    @player2 = player2
  end

  def attack(player)
    player.deduct_hp
  end
end
