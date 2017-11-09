require 'game'
# game class with attack method
describe Game do
let(:player2) { double(:player2, deduct_hp: true, hp:90, name: 'Marie') }
let(:player1) { double(:player1, deduct_hp: true, hp:90, name: 'JJ') }
let(:game) { described_class.new(player1, player2) }


  describe '#initialize' do
    it 'should be an instance of Game' do
      expect(game).to be_an_instance_of(Game)
    end
  end

  describe '#attack' do
    it 'should deduct points from player 2' do
      game.attack
      expect(player2.hp).to eq 90
    end
  end
  describe '#switch players' do
    it 'should switch players after each attack' do
      game.attack
      expect(game.player_turn).to eq 'Marie'
    end
    it 'should switch players after each attack' do
      game.attack
      game.attack
      expect(game.player_turn).to eq 'JJ'
    end
  end
end
