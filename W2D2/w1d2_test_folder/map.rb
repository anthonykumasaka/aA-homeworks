
# As you saw in the videos for tonight, a map can be implemented using a
# 2D array. Let's write a Map class (following a similar pattern to Stack
# and Queue) that implements a map using only arrays.
#
# Remember, a map stores information in key-value pairs, where the keys
# are always unique. When implemented with arrays, a map might look
# something like this: my_map = [[k1, v1], [k2, v2], [k3, v2], ...].
#
# Our Map class should have the following instance methods: set(key, value),
#  get(key), delete(key), show. Note that the set method can be used to
#  either create a new key-value pair or update the value for a pre-existing
#  key. It's up to you to check whether a key currently exists!
#
# As always, test your code thoroughly to make sure all properties of
# maps are enforced.

class Map
  attr_reader :map

  def initialize
    @map = []
  end

  def set(key, value)
    has_key = false

    self.map.each do |pair|
      if pair.first == key
        has_key = true
        pair.pop
        pair.push(value)
      end
    end

    if has_key == false
      self.map << [key, value]
    end
  end

  def get(key)
    self.map.each do |pair|
      return pair.last if pair.first == key
    end
    nil
  end

  def delete(key)
    self.map.reject! do |pair|
      pair.first == key
    end
  end

  def show
    @map
  end

end
