require_relative 'player'
#game class with attack method
class Game

  attr_reader :player1, :player2, :loser

  def initialize(player1,player2)
    @player1 = player1
    @player2 = player2
    @turn = 1
    @loser = nil
  end

  def self.game
    @@game
  end

  def self.game=(value)
    @@game = value
  end

  def attack
    attacked_player.deduct_hp
    loser_player?
    switch_turn
  end

  def player_turn
    return @player1.name if @turn == 1
      @player2.name
  end

  private

  def loser_player?
    if @player1.hp == 0
      @loser = @player1.name
    elsif @player2.hp == 0
      @loser = @player2.name
    else
      @loser = nil
    end
  end

  def switch_turn
    return @turn = 2 if @turn == 1
    @turn = 1
  end

  def attacked_player
    return @player2 if @turn == 1
    @player1
  end

end
