require_relative "calculator"
require_relative "commands"

class Main
  def initialize
    @calculator = Calculator.new
    @commands = {
      "+" => PlusCommand.new(@calculator),
      "-" => MinusCommand.new(@calculator),
      "*" => MultiplyCommand.new(@calculator),
      "/" => DivisionCommand.new(@calculator),
      "mod" => ModuloCommand.new(@calculator),
      "pow" => PowerCommand.new(@calculator),
      "++" => IncrementCommand.new(@calculator),
      "--" => DecrementCommand.new(@calculator),
      "sqrt" => SquareRootCommand.new(@calculator),
      "sin" => SineCommand.new(@calculator),
      "cos" => CosineCommand.new(@calculator),
      "tan" => TangentCommand.new(@calculator),
      "ctan" => CotangentCommand.new(@calculator),
      "exp" => ExponentialCommand.new(@calculator),
      "ln" => LogarithmCommand.new(@calculator),
      "!" => FactorialCommand.new(@calculator),
      "primes" => PrimesCommand.new(@calculator),
      "mw" => MemWriteCommand.new(@calculator),
      "mr" => MemReadCommand.new(@calculator),
      "push" => PushToStackCommand.new(@calculator),
      "pop" => PopFromStackCommand.new(@calculator)
    }
  end

  def run
    puts "Calculator has started"
    current = gets.chomp.to_f

    loop do
      operation = gets.chomp
      break if operation == "exit"

      begin
        operation = @commands[operation]
        raise "Operation not allowed" unless operation
        current = operation.execute(current)
      rescue => e
        puts "Error"
        puts e.message
      end

      puts current
    end
  end
end

Main.new.run
