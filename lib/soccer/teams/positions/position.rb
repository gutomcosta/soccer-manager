module Soccer
  module Teams
    module Positions
      class Position
        attr_reader :name

        def initializer
          @name = ""
        end

        def get_defender_positions(position)
          possibilities = {
            goalkeeper: { foward: 40, center_foward: 60 } ,
            defender: { center_foward: 40, foward: 40, midfielder: 20 },
            midfielder: { midfielder: 70, defender: 30 },
            foward: { defender: 100 },
            center_foward: { defender: 100 }
          }
          possibilities[position.name]
        end

      end
    end
  end
end

