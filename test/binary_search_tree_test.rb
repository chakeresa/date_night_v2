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

  def test_depth_of_returns_level_of_node_with_entered_value
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal 1, @tree.depth_of(92)
    assert_equal 2, @tree.depth_of(50)
    assert_nil @tree.depth_of(99)
  end

  def test_max_returns_hash_with_max_value_and_corresponding_data
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")

    expected = {"Sharknado 3" => 92}

    assert_equal expected, @tree.max
  end

  def test_max_returns_nil_when_empty_tree
    assert_nil @tree.max
  end

  def test_min_returns_hash_with_min_value_and_corresponding_data
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")

    expected = {"Johnny English" => 16}

    assert_equal expected, @tree.min
  end

  def test_min_returns_nil_when_empty_tree
    assert_nil @tree.min
  end

  def test_sort_returns_ary_of_hashes_sorted_lowest_to_highest_values_and_corresponding_data
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")

    expected = [
      {"Johnny English" => 16},
      {"Hannibal Buress: Animal Furnace" => 50},
      {"Bill & Ted's Excellent Adventure" => 61},
      {"Sharknado 3" => 92}
    ]

    assert_equal expected, @tree.sort
  end
end
