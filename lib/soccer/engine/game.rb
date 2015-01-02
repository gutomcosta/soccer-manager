module Soccer
  module Engine
    class Game
      attr_reader :subscribers

      def initialize(team1, team2, event_listener)
        @team1 = team1
        @team2 = team2
        @event_listener = event_listener
      end

      def subscribe(event, subscriber)
        @event_listener.subscribe(event, subscriber)
      end

      def start
        @event_listener.publish(:game_started, team1: @team1, team2: @team2)
      end

      def opponent_from(team)
        teams  = [@team1, @team2]
        teams.select {|t| t != team }.first
      end
    end
  end
end