# frozen_string_literal: true
require_relative './predicates'

VARIABLES = {}

def tokenize(string)
  throw ArgumentError unless valid_expression?(string)
  string
    .gsub('(', ' ( ')
    .gsub(')', ' ) ')
    .split(/ +/)
    .reject(&:empty?)
end

def parse(tokens)
  l = []
  until tokens.empty?
    token = tokens.shift
    if token == '('
      l << parse(tokens)
    elsif token == ')'
      return l
    else
      l << atom(token)
    end
  end
  l
end

def atom(token)
  if token.to_i.to_s == token
    Integer(token)
  else
    token.to_sym
  end
end

def reduce_list(expression)
  expression.compact.map { |element| reduce(element) }
end

# a expression is either an atom or a list.
# if it's a list, it starts with an operator.
def reduce(expression)
  if program?(expression)
    reduce_list(expression.drop(1))
  elsif variable?(expression)
    VARIABLES[expression]
  elsif atom?(expression)
    expression
  elsif define?(expression)
    VARIABLES[expression[1]] = expression[2]
    nil
  else
    op = reduce(expression.shift)
    rest = reduce_list(expression)
    rest.reduce(op)
  end
end

def evaluate(string)
  tokens = tokenize(string)
  parsed = parse(tokens).first
  result = reduce(parsed)
  if result.respond_to? :flatten
    result.flatten.compact.first
  else
    result
  end
end