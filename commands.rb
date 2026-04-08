class Command
  def initialize(calculator)
    @calculator = calculator
  end

  def enter_number
    gets.chomp.to_f
  end

  def execute(current)
    raise NotImplementedError
  end
end

class PlusCommand < Command
  def execute(current)
    @calculator.add(current, enter_number)
  end
end

class MinusCommand < Command
  def execute(current)
    @calculator.subtract(current, enter_number)
  end
end

class MultiplyCommand < Command
  def execute(current)
    @calculator.multiply(current, enter_number)
  end
end

class DivisionCommand < Command
  def execute(current)
    @calculator.divide(current, enter_number)
  end
end

class ModuloCommand < Command
  def execute(current)
    @calculator.modulo(current, enter_number)
  end
end

class PowerCommand < Command
  def execute(current)
    @calculator.power(current, enter_number)
  end
end

class IncrementCommand < Command
  def execute(current)
    @calculator.increment(current)
  end
end

class DecrementCommand < Command
  def execute(current)
    @calculator.decrement(current)
  end
end

class SquareRootCommand < Command
  def execute(current)
    @calculator.sqrt(current)
  end
end

class SineCommand < Command
  def execute(current)
    @calculator.sin(current)
  end
end

class CosineCommand < Command
  def execute(current)
    @calculator.cos(current)
  end
end

class TangentCommand < Command
  def execute(current)
    @calculator.tan(current)
  end
end

class CotangentCommand < Command
  def execute(current)
    @calculator.cot(current)
  end
end

class ExponentialCommand < Command
  def execute(current)
    @calculator.exp(current)
  end
end

class LogarithmCommand < Command
  def execute(current)
    @calculator.log(current)
  end
end

class FactorialCommand < Command
  def execute(current)
    @calculator.factorial(current)
  end
end

class PrimesCommand < Command
  def execute(current)
    @calculator.primes(current, enter_number)
  end
end

class MemWriteCommand < Command
  def execute(current)
    @calculator.mem_write(current)
  end
end

class MemReadCommand < Command
  def execute(current)
    @calculator.mem_read
  end
end

class PushToStackCommand < Command
  def execute(current)
    @calculator.push_to_stack(current)
  end
end

class PopFromStackCommand < Command
  def execute(current)
    @calculator.pop_from_stack
  end
end
