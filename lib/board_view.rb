class BoardView
  def initialize(board)
    @board = board
  end

  def to_s
    [
      "    A   B   C  \n",
      "  ╔═══╦═══╦═══╗\n",
      "  ║   ║   ║   ║\n",
      "1 ║   ║   ║   ║\n",
      "  ║   ║   ║   ║\n",
      "  ╠═══╬═══╬═══╣\n",
      "  ║   ║   ║   ║\n",
      "2 ║   ║   ║   ║\n",
      "  ║   ║   ║   ║\n",
      "  ╠═══╬═══╬═══╣\n",
      "  ║   ║   ║   ║\n",
      "3 ║   ║   ║   ║\n",
      "  ║   ║   ║   ║\n",
      "  ╚═══╩═══╩═══╝\n",
    ].join
  end
end
