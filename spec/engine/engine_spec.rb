require 'spec_helper'

describe Soccer::Engine do 
  
  describe '#new_game' do 
    let(:team1) { double }
    let(:team2) { double }
    let(:subscriber) { double}

    let(:game)  { Soccer::Engine.new_game(team1, team2) }
    it "creates an instance of game" do 
      expect(game).to_not be_nil
    end

    context "when subscribe initial events" do 
      it "subscribes game_started  " do 
        game.subscribe(:game_started, subscriber)
        expect(game.subscribers).to include(game_started: [subscriber])
      end

      it "subscribes game_finished" do 
        game.subscribe(:game_finished, subscriber)
        expect(game.subscribers).to include(game_finished: [subscriber])
      end
    end
  end

  
end
