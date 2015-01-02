require 'spec_helper'


describe Soccer::Engine::Game do 
  let(:team1) { double }
  let(:team2) { double }
  let(:soccer_event_listener) { double }
  let(:game) { Soccer::Engine::Game.new(team1, team2, soccer_event_listener)}

  describe ".start" do 
    it "publishes a game_started event" do 
      data = {team1: team1, team2: team2}
      expect(soccer_event_listener).to receive(:publish).with(:game_started, data)
      game.start
    end
  end

  describe ".opponent_from" do 
    it "gets the opponent of a team" do 
      opponent = game.opponent_from(team1)
      expect(opponent).to eql(team2)
    end
  end


end