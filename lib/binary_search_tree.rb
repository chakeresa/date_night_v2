require './lib/node'

class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(value, data)
    if @root.nil? 
      @root = Node.new(value, data, 0)
      0
    else
      insert_below(@root, value, data)
    end
  end

  def insert_below(node, value, data)
    
  end
end
