class ComputerPlayer < Player
  def next_play(board)
    board.empty_fields.first
  end
end
