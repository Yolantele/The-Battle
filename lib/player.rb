# player class
class Player
  attr_reader :name, :hp

  def initialize(name)
    @name = name
    @hp = 100
  end

  def deduct_hp
    @hp -= 10
  end

end
