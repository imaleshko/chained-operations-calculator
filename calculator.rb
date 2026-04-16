require "prime"

class Calculator
  attr_reader :current

  def initialize(number)
    @current = number
    @memory = 0
    @stack = []
  end

  def add(number)
    @current += number
  end

  def subtract(number)
    @current -= number
  end

  def multiply(number)
    @current *= number
  end

  def divide(number)
    raise "Division by zero" if number.zero?
    @current /= number
  end

  def modulo(number)
    raise "Division by zero" if number.zero?
    @current %= number
  end

  def power(number)
    @current **= number
  end

  def increment
    @current += 1
  end

  def decrement
    @current -= 1
  end

  def sqrt
    raise "Square root of negative number" if @current < 0
    @current = Math.sqrt(@current)
  end

  def to_radians(degrees)
    degrees * Math::PI / 180
  end

  def sin
    @current = Math.sin(to_radians(@current))
  end

  def cos
    @current = Math.cos(to_radians(@current))
  end

  def tan
    @current = Math.tan(to_radians(@current))
  end

  def cot
    tan = Math.tan(to_radians(@current))
    raise "Cotangent of zero" if tan == 0
    @current = 1.0 / tan
  end

  def exp
    @current = Math.exp(@current)
  end

  def log
    raise "Logarithm of negative number or zero" if @current <= 0
    @current = Math.log(@current)
  end

  def factorial
    raise "Factorial of negative number" if @current < 0
    result = 1
    (1..@current.to_i).each { |num| result *= num }
    @current = result
  end

  def primes(max, min = @current)
    raise "Max number must be greater than min number" if max < min
    raise "Max number must be greater than 1" if max < 1
    primes_list = Prime.each(max).select { |number| number > min && number < max }
    raise "No primes found" if primes_list.empty?
    primes_list.each do |number|
      @stack << number
    end
    @current = primes_list.last
  end

  def mem_write
    @memory = @current
  end

  def mem_read
    @current = @memory
  end

  def push_to_stack
    @stack << @current
  end

  def pop_from_stack
    raise "Stack is empty" if @stack.empty?
    @current = @stack.pop
  end
end
