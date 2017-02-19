describe Game do
  let(:player_a) { ComputerPlayer.new("🐈") }
  let(:player_b) { ComputerPlayer.new("🐒") }
  let(:game) { Game.new(player_a, player_b) }

  context "starting a new game" do
    it "#board" do
      expect(game.board.contents).to eq({})
    end

    it "#current_player" do
      expect(game.current_player.symbol).to eq("🐈")
    end

    it "#finished?" do
      expect(game.finished?).to eq(false)
    end

    it "#result" do
      expect(game.result).to eq(nil)
    end
  end

  context "one move by computer player" do
    before(:each) { game.next_play }
    it "#board" do
      expect(game.board.contents).to eq({"A1" => "🐈"})
    end

    it "#current_player" do
      expect(game.current_player.symbol).to eq("🐒")
    end

    it "#finished?" do
      expect(game.finished?).to eq(false)
    end

    it "#result" do
      expect(game.result).to eq(nil)
    end
  end

  context "7 moves by computer player" do
    before(:each) { 7.times{ game.next_play } }
    it "#board" do
      expect(game.board.contents).to eq({
        "A1" => "🐈",
        "A2" => "🐒",
        "A3" => "🐈",
        "B1" => "🐒",
        "B2" => "🐈",
        "B3" => "🐒",
        "C1" => "🐈",
        # A3 B2 C1 is 🐈 win
        # 🐈🐒🐈
        # 🐒🐈
        # 🐈🐒
      })
    end

    it "#current_player" do
      expect(game.current_player.symbol).to eq("🐒")
    end

    it "#finished?" do
      expect(game.finished?).to eq(true)
    end

    it "#result" do
      expect(game.result).to eq("🐈")
    end
  end
end
