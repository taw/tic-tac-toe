class CleverComputerPlayer < Player
  def next_play(board)
    possible_moves = board.empty_fields.map{|name|
      board_after_move = board.play(name, symbol)
      [score(board_after_move), name]
    }
    possible_moves.sort.last.last
  end

  def score(board)
    return 1000 if board.has_winning_line?(symbol)
    # This part doesn't work yet
    if board.empty_fields.any?{|name|
        board.play(name, @enemy_symbol).has_winning_line?(@enemy_symbol)
      }
      return 100
    end
    return 0
  end
end
