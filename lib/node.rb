class Node
  attr_reader :value,
              :data,
              :level

  def initialize(value, data, level)
    @value = value
    @data = data
    @level = level
  end
end
