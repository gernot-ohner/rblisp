require 'minitest/autorun'
require_relative '../src/main'

class MainTest < MiniTest::Test

  def test_evaluates_to_234
    input = '(program (define a 3) (define times *) (times a a (+ 1 (times 5 4) 5)))'
    expected = 234
    actual = evaluate(input)
    assert_equal(expected, actual)
  end

  def test_evaluates_to_16
    input = '(+ 1 (+ 2 3) (+ 7 3))'
    expected = 16
    actual = evaluate(input)
    assert actual == expected
  end

  def test_evaluates_to_0
    input = '(+ 1 (- 2 3))'
    expected = 0
    actual = evaluate(input)
    assert actual == expected
  end

  def test_evaluates_to_10
    input = '(+ (+ 2 3) (+ 2 3))'
    expected = 10
    actual = evaluate(input)
    assert actual == expected
  end

  def test_evaluates_to_minus_9
    input = '(- 1 (+ 2 3) (+ 2 3))'
    expected = -9
    actual = evaluate(input)
    assert actual == expected
  end

  def test_evaluates_to_minus_7
    input = '(* 1 (- 2 3) (+ 4 3))'
    expected = -7
    actual = evaluate(input)
    assert actual == expected
  end


end