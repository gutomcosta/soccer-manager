require 'spec_helper'


describe Soccer::Subscribers::GameStartedSubscriber do 

  let(:team1) { double }
  let(:team2) { double }
  let(:dice)  { double }
  let(:game_started_subscriber) { Soccer::Subscribers::GameStartedSubscriber.new(dice) }
 
  describe ".execute" do 
    before(:each) do 
      allow(team2).to receive(:start)
    end    

    it "should select a team to start a game" do
      expect(dice).to receive(:roll).and_return(team2)
      game_started_subscriber.execute(team1: team1, team2: team2)
    end
    
    it "should call for a selected team to start" do 
      allow(dice).to receive(:roll).and_return(team2)
      expect(team2).to receive(:start)
      game_started_subscriber.execute(team1: team1, team2: team2)
    end
  end

end