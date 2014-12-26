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

  describe ".publish" do 
    let(:subscriber) { double }
    let(:data) {double}

    before(:each) do 
      event_listener.subscribe(:game_started, subscriber)
    end
    
    it "should call subscriber execute if exists" do 
      expect(subscriber).to receive(:execute).with(data)

      event_listener.publish(:game_started, data)
    end

    it "should call nothing if doesn't exists a subuscriber for that event"  do 
      expect(subscriber).to_not receive(:execute).with(data)
      event_listener.publish(:game_finished, data)
    end

  end

  
end
