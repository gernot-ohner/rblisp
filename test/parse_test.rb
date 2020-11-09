require 'minitest/autorun'
require_relative '../src/main'

class ParserTest < Minitest::Unit::TestCase

  def test_parser_should_parse_correctly
    input = %w[( + 1 1 )]
    expected = [[:+, 1, 1]]
    actual = parse(input)
    assert_equal(expected, actual)
  end

  def test_parser_should_parse_correctly_2
    input = %w[( program ( define x 3 ) ( + x 1 )]
    expected = [[:program, [:define, :x, 3], [:+, :x, 1]]]
    actual = parse(input)
    assert_equal(expected, actual)
  end

  def test_parser_should_parse_correctly_3
    input = %w[( program ( define a 3 ) ( define times * ) ( times a a ( + 1 ( times 5 4 ) 5 ) ) )]
    expected = [[:program, [:define, :a, 3], [:define, :times, :*], [:times, :a, :a, [:+, 1, [:times, 5, 4], 5]]]]
    actual = parse(input)
    assert_equal(expected, actual)
  end

end