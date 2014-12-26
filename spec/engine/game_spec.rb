require 'spec_helper'


describe Soccer::Engine::Game do 
  let(:team1) { double }
  let(:team2) { double }
  let(:soccer_event_listener) { double }
  let(:game) { Soccer::Engine::Game.new(team1, team2, soccer_event_listener)}

  describe ".start" do 
    it "publishes a game_started event" do 
      expect(soccer_event_listener).to receive(:publish).with(:game_started)
      game.start
    end
  end


end