class Player
  attr_reader :symbol
  def initialize(symbol, enemy_symbol)
    @symbol = symbol
    @enemy_symbol = enemy_symbol
  end
end
