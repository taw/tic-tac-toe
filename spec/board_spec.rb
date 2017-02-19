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
end
