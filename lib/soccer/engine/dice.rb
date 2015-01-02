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

      def roll_to_choose(choices) 
        guess = roll((1..100).to_a)
        ranges = transform_in_ranges(choices)
        ranges.each_pair do |key, value|
          return key if value.include?(guess)
        end
      end

      private 

      def transform_in_ranges(choices)
        ranges        = {}
        sorted        = Hash[choices.sort_by {|k,v| v}.reverse]
        probablities  = sorted.values
        initial_value = 1
        next_value    = sorted.first[1]
        iterator = 0
        sorted.each_pair do |key, value|
          ranges[key] = (initial_value..next_value)
          initial_value = next_value + 1
          next_value  = value + probablities[iterator + 1] if iterator + 1 < probablities.size
          iterator+=1
        end
        ranges
      end
    end
  end
end


