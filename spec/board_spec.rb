describe Board do
  let(:board) { Board.new }
  it "#fields" do
    expect(board.fields).to eq(
      ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
    )
  end

  context "empty board" do
    it "all fields are empty" do
      expect(board.empty_fields).to eq(
        board.fields
      )
    end
  end

  context "board with some things on it" do
    let(:board) { Board.new(
      "A1" => "🐈",
      "A3" => "🐈",
      "B3" => "🐩",
    )}

    it "#empty_fields" do
      expect(board.empty_fields).to eq(
        ["A2", "B1", "B2", "C1", "C2", "C3"]
      )
    end

    it "#[]" do
      expect(board["A1"]).to eq("🐈")
      expect(board["B3"]).to eq("🐩")
      expect(board["C2"]).to eq(nil)
    end
  end

  it "error handling" do
    expect{ Board.new["D4"] }.to raise_error("No such field: D4")
    expect{ Board.new("D4" => "🐧") }.to raise_error("No such field: D4")
  end

  context "playing more moves" do
    let(:board) { Board.new(
      "A1" => "🐈",
      "A3" => "🐈",
      "B3" => "🐩",
    )}
    it "playing empty field" do
      new_board = board.play("C2", "🐒")
      expect(new_board["A1"]).to eq("🐈")
      expect(new_board["A2"]).to eq(nil)
      expect(new_board["C2"]).to eq("🐒")
      expect(board["C2"]).to eq(nil)
    end

    it "playing field with stuff on it" do
      expect{ board.play("A1", "🐒") }.to raise_error("Already filled: A1")
    end

    it "playing invalid field" do
      expect{ board.play("D4", "🐒") }.to raise_error("No such field: D4")
    end
  end

  context "#has_winning_line?" do
    context "empty board" do
      let(:board) { Board.new }
      it "nobody has winning lines" do
        expect(board.has_winning_line?("🐈")).to be false
      end
    end

    context "filled board" do
      let(:board) { Board.new(
        "A1" => "🐈",
        "A3" => "🐈",
        "A2" => "🐈",
        "B3" => "🐩",
        "C1" => "🐩",
      ) }
      it "🐈 has winning line" do
        expect(board.has_winning_line?("🐈")).to be true
        expect(board.has_winning_line?("🐩")).to be false
      end
    end

    context "overfilled board" do
      let(:board) { Board.new(
        "A1" => "🐈",
        "A2" => "🐈",
        "A3" => "🐈",
        "B1" => "🐩",
        "B2" => "🐩",
        "B3" => "🐩",
      ) }
      it "🐈 has winning line" do
        expect(board.has_winning_line?("🐈")).to be true
        expect(board.has_winning_line?("🐩")).to be true
        expect(board.has_winning_line?("🐎")).to be false
      end
    end
  end
end
