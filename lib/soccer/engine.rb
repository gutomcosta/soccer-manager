require "soccer/engine/version"
require "soccer/engine/game"
require "soccer/engine/randomizer"
require "soccer/engine/dice"
require "soccer/engine/event_listener"
require "soccer/subscribers/game_started_subscriber"

module Soccer
  module Engine

    def self.start_game(team1, team2, listener)
      game     = Game.new(team1, team2, listener )
      game.start
    end
  end
end
