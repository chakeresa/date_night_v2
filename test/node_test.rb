require './test/test_helper'

class NodeTest < Minitest::Test
  def setup
    @value = 61
    @data = "Bill & Ted's Excellent Adventure"
    @level = 0
    @node = Node.new(@value, @data, @level)
  end

  def test_it_exists
    assert_instance_of Node, @node
  end

  def test_it_inits_with_value_data_and_level
    assert_equal @value, @node.value
    assert_equal @data, @node.data
    assert_equal @level, @node.level
  end
end
