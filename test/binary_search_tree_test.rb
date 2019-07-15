require './test/test_helper'

class BinarySearchTreeTest < Minitest::Test
  def setup
    @tree = BinarySearchTree.new
  end

  def test_it_exists
    assert_instance_of BinarySearchTree, @tree
  end

  def test_it_starts_with_no_root
    assert_nil @tree.root
  end
  
  def test_it_inserts_nodes
    assert_equal 0, @tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 61, @tree.root.value

    assert_equal 1, @tree.insert(16, "Johnny English")
    assert_equal 16, @tree.root.left.value
    
    assert_equal 1, @tree.insert(92, "Sharknado 3")
    assert_equal 92, @tree.root.right.value
    
    assert_equal 2, @tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal 50, @tree.root.left.right.value
  end

  def test_it_returns_true_or_false_if_value_is_included
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal true, @tree.include?(16)
    assert_equal false, @tree.include?(72)
  end
end
