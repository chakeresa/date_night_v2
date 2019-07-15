class Node
  attr_reader :value,
              :data,
              :level

  attr_accessor :left,
                :right

  def initialize(value, data, level)
    @value = value
    @data = data
    @level = level
    @left = nil
    @right = nil
  end
end
