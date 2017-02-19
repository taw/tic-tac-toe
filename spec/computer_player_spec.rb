# Always playing on first empty field
describe ComputerPlayer do
  let(:player) { ComputerPlayer.new("🐈", "🐷") }
  context "empty board" do
    let(:board) { Board.new }
    it "plays A1" do
      expect(player.next_play(board)).to eq("A1")
    end
  end

  context "somewhat filled board" do
    let(:board) { Board.new(
        "A1" => "🐂",
        "A2" => "🐈",
        "B3" => "🐂",
    ) }
    it "plays A3" do
      expect(player.next_play(board)).to eq("A3")
    end
  end
end
