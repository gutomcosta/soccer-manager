module Soccer
  module Engine
    class Game
      attr_reader :subscribers

      def initialize(team1, team2)
        @team1 = team1
        @team2 = team2
        @subscribers = {}
      end

      def subscribe(event, subscriber)
        if @subscribers.has_key?(event)
          @subscribers[event] << subscriber
        else
         @subscribers[event] = [subscriber]
        end
      end
    end
  end
end