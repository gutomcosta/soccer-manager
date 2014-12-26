require 'spec_helper'

describe Soccer::Engine::EventListener do 
  let(:event_listener) { Soccer::Engine::EventListener.new}

  describe ".subscribe" do 
    it "add a event and one subscriber to subscriber list" do
      subscriber = double
      event_listener.subscribe(:game_started, subscriber) 
      expect(event_listener.subscribers).to include(game_started: [subscriber])
    end
  end

  
end
