require "soccer/engine/version"
require "soccer/engine/game"

module Soccer
  module Engine

    def self.new_game(team1, team2)
      Game.new(team1, team2)
    end
  end
end
