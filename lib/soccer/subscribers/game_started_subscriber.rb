module Soccer
  module Subscribers
    class GameStartedSubscriber

      def initialize(dice)
        @dice = dice
      end

      def execute(event)
        team1 = event[:team1]
        team2 = event[:team2]

        team = @dice.roll([team1, team2])
        team.start
      end
    end
  end
end