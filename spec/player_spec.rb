require 'player'
describe Player do

  let(:player1) { described_class.new('JJ') }

  context 'When player is created' do
    it 'should have a name' do
      expect(player1.name).to eq 'JJ'
    end
  end

end
