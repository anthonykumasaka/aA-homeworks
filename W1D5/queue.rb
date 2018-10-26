# Now let's write a Queue class. We will need the following instance
# methods: enqueue(el), dequeue, and peek.
#
# Test your code to ensure it follows the principle of FIFO.


class Queue
  attr_reader :queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    self.queue.unshift(el)
  end

  def dequeue
    self.queue.pop
  end

  def peek
    self.queue.last
  end

end
