class Game
  attr_reader :board

  def initialize(player_a, player_b)
    @players = [player_a, player_b]
    @current_player = 0
    @board = Board.new
    @finished = false
    @result = nil
  end

  def current_player
    @players[@current_player]
  end

  def finished?
    @finished
  end

  def result
    @result
  end

  def next_play
    move = current_player.next_play(board)
    @board = @board.play(move, current_player.symbol)
    if @current_player == 0
      @current_player = 1
    else
      @current_player = 0
    end

    check_if_game_finished
  end

private

  def check_if_game_finished
    if @board.empty_fields.size == 0
      @finished = true
      @result = "draw"
    elsif @board.has_winning_line?(@players[0].symbol)
      @finished = true
      @result = @players[0].symbol
    elsif @board.has_winning_line?(@players[1].symbol)
      @finished = true
      @result = @players[1].symbol
    end
  end
end
