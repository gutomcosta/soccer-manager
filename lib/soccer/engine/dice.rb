module Soccer
  module Engine
    class Dice

      def initialize(randomizer)
        @randomizer = randomizer
      end

      def roll(array)
        raise "[ Dice.roll ] - Empty Array" if array.empty? 
        size  = array.size - 1
        range = (0..size)
        index = @randomizer.randomize(range)
        array[index]
      end
    end
  end
end

