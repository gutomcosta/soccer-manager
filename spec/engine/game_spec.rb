require 'spec_helper'


describe Soccer::Engine::Game do 
  let(:team1) { double }
  let(:team2) { double }
  let(:soccer_event_listener) { double }
  let(:game) { Soccer::Engine::Game.new(team1, team2, soccer_event_listener)}

  describe ".subscribe" do 
    it "add a event and one subscriber to subscribers list" do 
      subscriber = double
      game.subscribe(:game_started, subscriber)

      expect(game.subscribers).to include(game_started: [subscriber])
    end
    
    it "add a event and many subscribers to subscribers list" do 
      subscriber1 = double
      subscriber2 = double
      game.subscribe(:game_started, subscriber1)
      game.subscribe(:game_started, subscriber2)

      expect(game.subscribers).to include(game_started: [subscriber1, subscriber2])
    end
  end

  describe ".start" do 
    it "publishes a game_started event" do 
      expect(soccer_event_listener).to receive(:publish).with(:game_started)
      game.start
    end
  end


end