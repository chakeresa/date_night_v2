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

  def include?(value)
    if @root.nil? 
      false
    else
      search_below(@root, value)
    end
  end

  def depth_of(value)
    return nil if !include?(value)

    get_level_below(@root, value)
  end

  def max
    if @root.nil? 
      nil
    else
      max_below(@root)
    end
  end

  def min
    if @root.nil? 
      nil
    else
      min_below(@root)
    end
  end

  def sort
    
  end

  private

  def max_below(node_above)
    if node_above.right
      max_below(node_above.right)
    else
      {node_above.data => node_above.value}
    end
  end

  def min_below(node_above)
    if node_above.left
      min_below(node_above.left)
    else
      {node_above.data => node_above.value}
    end
  end

  def get_level_below(node_above, value)
    value_above = node_above.value
    return node_above.level if value_above == value

    if value < value_above
      get_level_below(node_above.left, value)
    else
      get_level_below(node_above.right, value)
    end
  end

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

  def search_below(node_above, value)
    return true if node_above.value == value

    if value < node_above.value
      node_above.left ? search_below(node_above.left, value) : false
    else
      node_above.right ? search_below(node_above.right, value) : false
    end
  end
end
