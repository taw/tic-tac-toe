class BoardView
  def initialize(board)
    @board = board
  end

  def to_s
    empty_board = [
      "    A   B   C  \n",
      "  ╔═══╦═══╦═══╗\n",
      "  ║   ║   ║   ║\n",
      "1 ║ @ ║ @ ║ @ ║\n",
      "  ║   ║   ║   ║\n",
      "  ╠═══╬═══╬═══╣\n",
      "  ║   ║   ║   ║\n",
      "2 ║ @ ║ @ ║ @ ║\n",
      "  ║   ║   ║   ║\n",
      "  ╠═══╬═══╬═══╣\n",
      "  ║   ║   ║   ║\n",
      "3 ║ @ ║ @ ║ @ ║\n",
      "  ║   ║   ║   ║\n",
      "  ╚═══╩═══╩═══╝\n",
    ].join

    cell_content = %W[
      A1 B1 C1 A2 B2 C2 A3 B3 C3
    ].map{|name| @board[name] || " "}

    empty_board.gsub(/@/){
      cell_content.shift
    }
  end
end
