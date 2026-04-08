require "prime"

class Calculator
  def initialize
    @memory = 0
    @stack = []
  end

  def add(number1, number2)
    number1 + number2
  end

  def subtract(number1, number2)
    number1 - number2
  end

  def multiply(number1, number2)
    number1 * number2
  end

  def divide(number1, number2)
    raise "Division by zero" if number2.zero?
    number1 / number2
  end

  def modulo(number1, number2)
    raise "Division by zero" if number2.zero?
    number1 % number2
  end

  def power(number1, number2)
    number1**number2
  end

  def increment(number)
    number + 1
  end

  def decrement(number)
    number - 1
  end

  def sqrt(number)
    raise "Square root of negative number" if number < 0
    Math.sqrt(number)
  end

  def to_radians(degrees)
    degrees * Math::PI / 180
  end

  def sin(number)
    Math.sin(to_radians(number))
  end

  def cos(number)
    Math.cos(to_radians(number))
  end

  def tan(number)
    Math.tan(to_radians(number))
  end

  def cot(number)
    tan = tan(number)
    raise "Cotangent of zero" if tan == 0
    1.0 / tan
  end

  def exp(number)
    Math.exp(number)
  end

  def log(number)
    raise "Logarithm of negative number or zero" if number <= 0
    Math.log(number)
  end

  def factorial(number)
    raise "Factorial of negative number" if number < 0
    result = 1
    (1..number.to_i).each { |num| result *= num }
    result
  end

  def primes(min, max)
    raise "Max number must be greater than min number" if max < min
    raise "Max number must be greater than 1" if max < 1
    primes_list = Prime.each(max).select { |number| number > min && number < max }
    raise "No primes found" if primes_list.empty?
    primes_list.each do |number|
      @stack << number
    end
    primes_list.last
  end

  def mem_write(number)
    @memory = number
  end

  def mem_read
    @memory
  end

  def push_to_stack(number)
    @stack << number
    number
  end

  def pop_from_stack
    raise "Stack is empty" if @stack.empty?
    @stack.pop
  end
end
