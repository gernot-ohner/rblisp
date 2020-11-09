require 'minitest/autorun'
require_relative '../../src/predicates'

class PredicateTest < MiniTest::Test

  def test_define_invocation_with_key_value_is_valid
    input = [:define, :x, 3]
    actual = define? input
    assert actual == true
  end

  def test_define_invocation_with_extra_data_is_invalid
    input = [:define, :x, 3, 4, 5, 6]
    actual = define? input
    assert actual == false
  end

  def test_define_not_in_first_position
    input = [:x, :define, 3]
    actual = define? input
    assert actual == false
  end

  def test_define_integer_is_invalid
    input = [:define, 1, 3]
    actual = define? input
    assert actual == false
  end

  def test_define_string_is_invalid
    input = [:define, 'x', 3]
    actual = define? input
    assert actual == false
  end

  def test_define_without_value_is_invalid
    input = [:define, :x]
    actual = define? input
    assert actual == false
  end

  def test_define_without_key_is_invalid
    input = [:define]
    actual = define? input
    assert actual == false
  end
end