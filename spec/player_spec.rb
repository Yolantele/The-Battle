require 'player'
describe Player do

  let(:player1) { described_class.new('JJ') }

  context 'When player is created' do
    it 'should have a name' do
      expect(player1.name).to eq 'JJ'
    end
    it 'should have 100 HP' do
      expect(player1.hp).to eq 100
    end
  end

  context 'When being attacked' do
    it "should deduct 10HP" do
      player1.deduct_hp
      expect(player1.hp).to eq 90
    end
  end

end
