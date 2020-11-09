require 'minitest/autorun'
require_relative '../src/main'

class TokenizerTest < MiniTest::Test

  def test_should_tokenize_correctly_1
    input = '(program (+ 1 (- 3 3)))'
    expected = %w[( program ( + 1 ( - 3 3 ) ) )]
    actual = tokenize(input)
    assert_equal(actual, expected)
  end

  def test_should_tokenize_correctly_2
    input = '(1 (false 3 3))'
    expected = %w[( 1 ( false 3 3 ) )]
    actual = tokenize(input)
    assert_equal(actual, expected)
  end

  def test_should_tokenize_correctly_3
    input = '(program (define x 3) (* x (- x 3)))'
    expected = %w[( program ( define x 3 ) ( * x ( - x 3 ) ) )]
    actual = tokenize(input)
    assert_equal(actual, expected)
  end

  def test_should_throw_error_for_invalid_expression
    input = "this is an invalid expression"
    assert_raises ArgumentError do
      tokenize(input)
    end
  end
end