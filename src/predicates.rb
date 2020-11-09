def atom?(expression)
  expression.is_a?(Integer) || expression.is_a?(Symbol)
end

def variable?(expression)
  VARIABLES.key? expression
end

def valid_expression?(string)
  # part 1: find out if parens are balanced
  # part 2: find out if there is only one top level paren

  paren_count = 0
  string.chars[0...-1].each do |c|
    paren_count += 1 if c == '('
    paren_count -= 1 if c == ')'
    return false if paren_count.zero?
  end
  paren_count == 1 && string.chars.last == ')'
end

def define?(expression)
  expression.respond_to?(:slice) &&
    expression[0] == :define &&
    expression[1].is_a?(Symbol) &&
    expression.length == 3
end

def program?(expression)
  expression.respond_to?(:first) && expression.first == :program
end
