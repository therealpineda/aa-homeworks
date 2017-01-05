
# ## Big O-ctopus and Biggest Fish

# A Very Hungry Octopus wants to eat the longest fish in an array of fish.

# ```
fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"
# ```

# ### Sluggish Octopus
# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths

def sluggish_oct(fishes)
    longest = ""
    fishes.each do |fish1|
        fishes.each do |fish2|
            if fish1.length > fish2.length
                longest = fish1
            else
                longest = fish2
            end
        end
    end
    longest
end

p sluggish_oct(fishes)

# ### Dominant Octopus
# Find the longest fish in O(n log n) time.
# Hint: You saw a sorting algorithm that runs in O(n log n) in the [Sorting Demo][sorting-demo]. Remember that Big O is classified by the dominant term.

class Array

  def merge_sort(&prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    return self if length <= 1

    mid = length / 2
    sorted_left = self.take(mid).merge_sort(&prc)
    sorted_right = self.drop(mid).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left).concat(right)
    
  end
end

def dominant_oct(fishes)
  prc = Proc.new { |el1, el2| el1.length <=> el2.length }
  fishes.merge_sort(&prc).last
end

p dominant_oct(fishes)

# ### Clever Octopus
# Find the longest fish in O(n) time. The octopus can hold on to the longest fish that you have found so far while stepping through the array only once.

def clever_oct(fishes)
   longest = ""
   fishes.each do |fish|
       longest = fish if fish.length > longest.length
   end
   longest
end

p clever_oct(fishes)

# ## Dancing Octopus
# Full of fish, the Octopus attempts [Dance Dance Revolution][ddr].
# The game has tiles in the following directions:
# ```
# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
# ```
# To play the game, the octopus must step on a tile with her corresponding tentacle.
# We can assume that the octopus's eight tentacles are numbered and correspond to the tile direction indices.


# ### Slow Dance
# Given a tile direction, iterate through a tiles array to return the tentacle number (tile index) the octopus must move.
# This should take O(n) time.

tiles = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles)
    tiles.each_with_index do |tile, tent_num|
        return tent_num if tile == direction
    end
end

p slow_dance("down", tiles)


# # ### Constant Dance!
# # Now that the octopus is warmed up, let's help her dance faster.
# # Use a different data structure and write a new function so that you can access the tentacle number in O(1) time.

tiles = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
    }
    
def constant_dance(direction, tiles)
    tiles[direction]
end

p constant_dance("down", tiles)