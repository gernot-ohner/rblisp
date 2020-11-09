require 'minitest/autorun'
require_relative '../../src/predicates'

class PredicateTest < MiniTest::Unit::TestCase

  def test_integer_is_atom
    actual = atom? 1
    assert actual
  end

  def test_symbol_is_atom
    actual = atom? :yes
    assert actual
  end

  def test_string_is_not_atom
    actual = atom? 'no'
    assert actual == false
  end

  def test_proc_is_not_atom
    my_proc = proc { |i| i == 1 }
    actual = atom? my_proc
    assert actual == false
  end





end



