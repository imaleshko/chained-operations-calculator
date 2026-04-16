class Command
  def initialize(calculator)
    @calculator = calculator
  end

  def execute
    raise NotImplementedError
  end
end

class PlusCommand < Command
  def execute(number)
    @calculator.add(number)
  end
end

class MinusCommand < Command
  def execute(number)
    @calculator.subtract(number)
  end
end

class MultiplyCommand < Command
  def execute(number)
    @calculator.multiply(number)
  end
end

class DivisionCommand < Command
  def execute(number)
    @calculator.divide(number)
  end
end

class ModuloCommand < Command
  def execute(number)
    @calculator.modulo(number)
  end
end

class PowerCommand < Command
  def execute(number)
    @calculator.power(number)
  end
end

class IncrementCommand < Command
  def execute
    @calculator.increment
  end
end

class DecrementCommand < Command
  def execute
    @calculator.decrement
  end
end

class SquareRootCommand < Command
  def execute
    @calculator.sqrt
  end
end

class SineCommand < Command
  def execute
    @calculator.sin
  end
end

class CosineCommand < Command
  def execute
    @calculator.cos
  end
end

class TangentCommand < Command
  def execute
    @calculator.tan
  end
end

class CotangentCommand < Command
  def execute
    @calculator.cot
  end
end

class ExponentialCommand < Command
  def execute
    @calculator.exp
  end
end

class LogarithmCommand < Command
  def execute
    @calculator.log
  end
end

class FactorialCommand < Command
  def execute
    @calculator.factorial
  end
end

class PrimesCommand < Command
  def execute(number)
    @calculator.primes(number)
  end
end

class MemWriteCommand < Command
  def execute
    @calculator.mem_write
  end
end

class MemReadCommand < Command
  def execute
    @calculator.mem_read
  end
end

class PushToStackCommand < Command
  def execute
    @calculator.push_to_stack
  end
end

class PopFromStackCommand < Command
  def execute
    @calculator.pop_from_stack
  end
end
