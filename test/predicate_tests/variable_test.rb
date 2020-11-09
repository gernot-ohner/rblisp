require 'minitest/autorun'
require_relative '../../src/predicates'
require_relative '../../src/main'

class VariableTest < MiniTest::Test

  def test_variable_exists
    input = :hey
    VARIABLES[input] = 1
    assert variable? input
  end

  def test_variable_doesnt_exist
    input = :you
    assert variable?(input) == false
  end

end



