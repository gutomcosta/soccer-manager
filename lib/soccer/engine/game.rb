module Soccer
  module Engine
    class Game
      attr_reader :subscribers

      def initialize(team1, team2, event_listener)
        @team1 = team1
        @team2 = team2
        @event_listener = event_listener
        @subscribers = {}
      end

      def subscribe(event, subscriber)
        @event_listener.subscribe(event, subscriber)
      end

      def start
        @event_listener.publish(:game_started, team1: @team1, team2: @team2)
      end
    end
  end
end