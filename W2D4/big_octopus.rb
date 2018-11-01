# ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"


# Sluggish Octopus
# Find the longest fish in O(n^2) time. Do this by comparing all fish
# lengths to all other fish lengths


def sluggish_octopus(array)

  sorted = false
  until sorted
    sorted = true

    array.each_index do |i|
      next if i == array.length - 1
      j = i + 1

      if array[i].length > array[j].length
        sorted = false
        array[i], array[j] = array[j], array[i]
      end
    end
  end
  array.last

end

# Dominant Octopus
# Find the longest fish in O(n log n) time. Hint: You saw a sorting
# algorithm that runs in O(n log n) in the Sorting Demo. Remember that
# Big O is classified by the dominant term.
def dominant_octopus(array, &prc)
  prc ||= Proc.new {|x, y| x <=> y}

  return array if array.length <= 1
  mid = array.length / 2

  left = dominant_octopus(array[0...mid], &prc)
  right = dominant_octopus(array[mid..-1], &prc)

  merge(left, right, &prc)
end

def merge(left, right, &prc)
  results = []

  until left.empty? || right.empty?
    if prc.call(left[0], right[0]) == 1
      results << right.shift
    else
      results << left.shift
    end
  end
  results + left + right
end

def merge_helper(array, &prc)
  prc = Proc.new { |x, y| y.length <=> x.length }
  dominant_octopus(array,&prc).first
end

# Clever Octopus
# Find the longest fish in O(n) time. The octopus can hold on to the
# longest fish that you have found so far while stepping through the
# array only once.

def clever_octopus(array)
  max = nil
  array.each_with_index do |el, i|
    if max == nil || max.length < el.length
      max = el
    end
  end
  max
end

# Dancing Octopus
# Full of fish, the Octopus attempts Dance Dance Revolution. The game has
# tiles in the following directions:
#
# tiles_array = ["up", "right-up", "right", "right-down", "down",
#   "left-down", "left",  "left-up" ]
# To play the game, the octopus must step on a tile with her corresponding
# tentacle. We can assume that the octopus's eight tentacles are numbered
# and correspond to the tile direction indices.
#
# Slow Dance
# Given a tile direction, iterate through a tiles array to return the
# tentacle number (tile index) the octopus must move. This should take O(n) time.

def slow_dance(tile, array)
  array.each_with_index do |el, i|
    return i if el == tile
  end
end

# tiles = {
#     "up" => 0,
#     "right-up" => 1,
#     "right"=> 2,
#     "right-down" => 3,
#     "down" => 4,
#     "left-down" => 5,
#     "left" => 6,
#     "left-up" => 7
# }
#
# def constant_dance(tile, tiles)
#   tiles[tile]
# end

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end
