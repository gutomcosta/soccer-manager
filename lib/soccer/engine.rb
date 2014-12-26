require "soccer/engine/version"
require "soccer/engine/game"
require "soccer/engine/event_listener"

module Soccer
  module Engine

    def self.start_game(team1, team2, listener)
      game     = Game.new(team1, team2, listener )
      game.start
    end
  end
end
