
def atom?(expression)
  expression.is_a?(Integer) || expression.is_a?(Symbol)
end

def variable?(expression)
  VARIABLES.key? expression
end

def valid_expression?(string)
  string.count('(').positive?
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
