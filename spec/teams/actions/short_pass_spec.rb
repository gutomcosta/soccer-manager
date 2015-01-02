require 'spec_helper'


describe Soccer::Teams::Actions::ShortPass do
  let(:event_listener) { double }
  let(:game) { double }
  let(:player) { double(position: double) }
  let(:defender) { double }
  let(:team) { double }
  let(:short_pass) { Soccer::Teams::Actions::ShortPass.new(event_listener, game, double)}
  let(:action_data) { {player: player, team: team} }

  describe ".execute" do 

    before(:each) do 
      allow(game).to receive(:opponent_from).and_return(team)
      allow(team).to receive(:get_defender_for).and_return(defender)
      allow(player).to receive(:final_score_against).and_return(150)
    end

    it "gets the opponent team from the game" do 
      expect(game).to receive(:opponent_from).with(team)
      short_pass.execute(action_data)

    end

    it "gets the defender player from opponent team" do 
      expect(team).to receive(:get_defender_for).with(player.position)
      short_pass.execute(action_data)
    end

    it "get the final score of a player against a defender" do 
      expect(player).to receive(:final_score_against).with(defender)
      short_pass.execute(action_data)
    end

    context "publish the ball intercept event" do 
      
      it "publishes if the score is less the zero" do 
        allow(player).to receive(:final_score_against).and_return(-19)
        expect(event_listener).to receive(:publish).with(:ball_intercepted, player: player, defender: defender, game: game)
        short_pass.execute(action_data)
      end

      it "publishes if the score is equals to zero" do 
        allow(player).to receive(:final_score_against).and_return(0)
        expect(event_listener).to receive(:publish).with(:ball_intercepted, player: player, defender: defender, game: game)
        short_pass.execute(action_data)
      end
    end

    context "publish the cross_touch_line event" do 
      
      it "publishes if the score is between 1 and 5" do 
        allow(player).to receive(:final_score_against).and_return(1,3,5)
        expect(event_listener).to receive(:publish).with(:cross_touch_line, player: player, defender: defender, game: game).exactly(3).times
        short_pass.execute(action_data)
        short_pass.execute(action_data)
        short_pass.execute(action_data)
      end
    end

    context "publish the cross_corner_line event " do 
      it "publishes if the score is between 6 and 8" do 
        allow(player).to receive(:final_score_against).and_return(6,7,8)
        expect(event_listener).to receive(:publish).with(:cross_corner_line, player: player, defender: defender,game: game).exactly(3).times
        short_pass.execute(action_data)
        short_pass.execute(action_data)
        short_pass.execute(action_data)
      end
    end

    context "publish the wrong_pass event " do 
      it "publishes if the score is between 9 and 30" do 
        allow(player).to receive(:final_score_against).and_return(9,10,29,30)
        expect(event_listener).to receive(:publish).with(:wrong_pass, player: player, defender: defender,game: game).exactly(4).times
        short_pass.execute(action_data)
        short_pass.execute(action_data)
        short_pass.execute(action_data)
        short_pass.execute(action_data)
      end
    end

    context "publish the right_pass event " do 
      it "publishes if the score is between 31 and 100" do 
        allow(player).to receive(:final_score_against).and_return(39,31,78, 100)
        expect(event_listener).to receive(:publish).with(:right_pass, player: player, defender: defender,game: game).exactly(4).times
        short_pass.execute(action_data)
        short_pass.execute(action_data)
        short_pass.execute(action_data)
        short_pass.execute(action_data)
      end
    end


  end
end
