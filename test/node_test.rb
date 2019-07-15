require './test/test_helper'

class NodeTest < Minitest::Test
  def setup
    @value = 61
    @data = "Bill & Ted's Excellent Adventure"
    @node = Node.new(@value, @data)
  end

  def test_it_exists
    assert_instance_of Node, @node
  end

  def test_it_inits_with_value_and_data
    assert_equal @value, @node.value
    assert_equal @data, @node.data
  end
end
