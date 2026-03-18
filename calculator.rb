class Calculator
  def initialize
    @memory = 0
  end

  def mem_write(value)
    @memory = value
  end

  def enter
    gets.chomp.to_f
  end

  def error(value)
    puts "Error"
    value
  end

  def to_radians(degrees)
    degrees * Math::PI / 180
  end

  def add(value)
    value + enter
  end

  def subtraction(value)
    value - enter
  end

  def multiplication(value)
    value * enter
  end

  def division(value)
    entered = enter
    return value / entered if entered != 0
    error(value)
  end

  def modulo(value)
    entered = enter
    return value % entered if entered != 0
    error(value)
  end

  def exponentiation(value)
    value ** enter
  end

  def increment(value)
    value + 1
  end

  def decrement(value)
    value - 1
  end

  def square_root(value)
    return Math.sqrt(value) if value >= 0
    error(value)
  end

  def sine(value)
    Math.sin(to_radians(value))
  end

  def cosine(value)
    Math.cos(to_radians(value))
  end

  def tangent(value)
    Math.tan(to_radians(value))
  end

  def cotangent(value)
    tan = tangent(value)
    return 1.0 / tan if tan != 0
    error(value)
  end

  def exponential(value)
    Math.exp(value)
  end

  def logarithm(value)
    return Math.log(value) if value > 0
    error(value)
  end

  def factorial(value)
    return error(value) if value < 0
    result = 1
    (1..value.to_i).each { |number| result *= number }
    result
  end

  def calculation(current, operation)
    case operation
    when "+"
      add(current)
    when "-"
      subtraction(current)
    when "*"
      multiplication(current)
    when "/"
      division(current)
    when "mod"
      modulo(current)
    when "pow"
      exponentiation(current)
    when "++"
      increment(current)
    when "--"
      decrement(current)
    when "sqrt"
      square_root(current)
    when "sin"
      sine(current)
    when "cos"
      cosine(current)
    when "tan"
      tangent(current)
    when "ctan"
      cotangent(current)
    when "exp"
      exponential(current)
    when "ln"
      logarithm(current)
    when "!"
      factorial(current)
    when "mw"
      mem_write(current)
      current
    when "mr"
      @memory
    else
      puts "Operation not allowed"
      current
    end
  end

  def run
    puts "Calculator has started"
    current = gets.chomp.to_f
    loop do
      operation = gets.chomp
      break if operation == "exit"
      current = calculation(current, operation)
      puts current
    end
  end
end

calculator = Calculator.new
calculator.run
