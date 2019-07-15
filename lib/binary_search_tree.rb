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

  private

  def insert_below(node_above, value, data)
    if value < node_above.value
      insert_left(node_above, value, data)
    else
      insert_right(node_above, value, data)
    end
  end

  def insert_left(node_above, value, data)
    left_node = node_above.left
    if left_node.nil?
      level = node_above.level + 1
      node_above.left = Node.new(value, data, level)
      level
    else
      insert_below(left_node, value, data)
    end
  end

  def insert_right(node_above, value, data)
    right_node = node_above.right
    if right_node.nil?
      level = node_above.level + 1
      node_above.right = Node.new(value, data, level)
      level
    else
      insert_below(right_node, value, data)
    end
  end
end
