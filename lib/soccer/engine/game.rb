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
        if @subscribers.has_key?(event)
          @subscribers[event] << subscriber
        else
         @subscribers[event] = [subscriber]
        end
      end

      def start
        @event_listener.publish(:game_started)
      end
    end
  end
end