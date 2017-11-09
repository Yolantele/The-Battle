require_relative 'player'
#game class with attack method
class Game

  attr_reader :player1, :player2

  def initialize(player1,player2)
    @player1 = player1
    @player2 = player2
    @turn = 1
  end

  def attack
    attacked_player.deduct_hp
    switch_turn
  end

  def player_turn
    return @player1.name if @turn == 1
      @player2.name
  end

  private

  def switch_turn
    return @turn = 2 if @turn == 1
    @turn = 1
  end

  def attacked_player
    return @player2 if @turn == 1
    @player1
  end

end
