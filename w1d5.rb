 class Stack

    attr_reader :stack

    def initialize
      # create ivar to store stack here!
      @stack = []
    end

    def push(el)
      # adds an element to the stack
      stack << el
      el
    end

    def pop
      # removes one element from the stack
      stack.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      stack.last
    end
  
end

class Queue
    attr_reader :queue
    def initialize
      @queue = []
    end

    def enqueue(el)
        queue.unshift(el)
    end
    
    def dequeue
        queue.shift
    end

    def peek
        queue.first
    end
end

class Map
    attr_accessor :map
    def initialize
      @map = []
    end

    def set(key, value)
        
    end
    
    def get(key)
        pair = map.select{|pairs| pairs[0] == key}
        pair[1]
    end

    def delete(key)
        
    end

    def show

    end
end