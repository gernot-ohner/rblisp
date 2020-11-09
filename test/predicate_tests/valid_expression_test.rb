require 'minitest/autorun'
require_relative '../../src/predicates'
require_relative '../../src/main'

class ValidExpressionTest < MiniTest::Test

  def test_balanced_parens_are_valid_1
    input = '(program (+ 1 1))'
    actual = valid_expression? input
    assert actual
  end

  def test_balanced_parens_are_valid_2
    input = '(program (+ 1 1)(- 3 3))'
    actual = valid_expression? input
    assert actual
  end

  def test_too_many_open_parens_are_invalid
    input = '(program (+ 1 (1))'
    actual = valid_expression? input
    assert actual == false
  end

  def test_invalid_1
    input = '())program (+ 1 1)(- 3 3))'
    actual = valid_expression? input
    assert actual == false
  end

  def test_multiple_top_level_parens_are_invalid
    input = '()(program (+ 1 1)(- 3 3))'
    actual = valid_expression? input
    assert actual == false
  end

end



