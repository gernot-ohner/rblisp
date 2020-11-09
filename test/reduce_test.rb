require 'minitest/autorun'
require_relative '../src/main'

class ReduceTest < Minitest::Unit::TestCase

  def test_should_reduce_to_2
    input = [:program, [:+, 1, 1]]
    expected = [2]
    actual = reduce(input)
    assert_equal(expected, actual)
  end

  def test_should_reduce_to_4
    input = [:program, [:define, :x, 3], [:+, :x, 1]]
    expected = [nil, 4]
    actual = reduce(input)
    assert_equal(expected, actual)
  end

  def test_should_reduce_to_234
    input = [:program, [:define, :a, 3], [:define, :times, :*], [:times, :a, :a, [:+, 1, [:times, 5, 4], 5]]]
    expected = [nil, nil, 234]
    actual = reduce(input)
    assert_equal(expected, actual)
  end

end
