describe HumanPlayer do
  let(:player) { HumanPlayer.new("🐈") }
  let(:board) { Board.new }
  let(:output) { $stdout.string }

  before(:each) do
    @orig_stdin = $stdin
    @orig_stdout = $stdout
    $stdin = StringIO.new(input)
    $stdout = StringIO.new()
  end

  after(:each) do
    $stdin = @orig_stdin
    $stdout = @orig_stdout
  end

  context "asks for a move" do
    let(:input) { "A1\n" }
    it do
      expect(player.next_play(board)).to eq("A1")
      expect(output).to eq("Please place your next 🐈\n")
    end
  end

  context "keeps asking if field is invalid" do
    let(:input) { "D5\n" + "B2\n" }
    it do
      expect(player.next_play(board)).to eq("B2")
      expect(output).to eq(
        "Please place your next 🐈\n" +
        "D5 is not valid. Please place your next 🐈\n"
      )
    end
  end

  context "keeps asking if field is not empty" do
    let(:board) { Board.new("C2" => "🐷")}
    let(:input) { "C2\n" + "B3\n" }
    it do
      expect(player.next_play(board)).to eq("B3")
      expect(output).to eq(
        "Please place your next 🐈\n" +
        "C2 is not empty. Please place your next 🐈\n"
      )
    end
  end
end
