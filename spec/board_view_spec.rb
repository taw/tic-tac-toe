describe BoardView do
  let(:view) { BoardView.new(board) }

  context "board is empty" do
    let(:board) { Board.new }
    it "looks nice" do
      expect(view.to_s).to eq([
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
      ].join)
    end
  end
end
