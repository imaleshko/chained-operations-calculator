require_relative "calculator"
require_relative "commands"

class Main
  def initialize
    puts "Calculator has started"
    @calculator = Calculator.new(gets.chomp.to_f)
    @commands_with_additional_operand = {
      "+" => PlusCommand.new(@calculator),
      "-" => MinusCommand.new(@calculator),
      "*" => MultiplyCommand.new(@calculator),
      "/" => DivisionCommand.new(@calculator),
      "mod" => ModuloCommand.new(@calculator),
      "pow" => PowerCommand.new(@calculator),
      "primes" => PrimesCommand.new(@calculator)
    }
    @commands_without_additional_operand = {
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
      "mw" => MemWriteCommand.new(@calculator),
      "mr" => MemReadCommand.new(@calculator),
      "push" => PushToStackCommand.new(@calculator),
      "pop" => PopFromStackCommand.new(@calculator)
    }
  end

  def execute(operation)
    if @commands_with_additional_operand.key?(operation)
      @commands_with_additional_operand[operation].execute(gets.chomp.to_f)
    elsif @commands_without_additional_operand.key?(operation)
      @commands_without_additional_operand[operation].execute
    else
      raise "Operation not exist"
    end
  end

  def run
    loop do
      operation = gets.chomp
      break if operation == "exit"

      begin
        execute(operation)
      rescue RuntimeError => e
        puts "Error"
        puts e.message
      end

      puts @calculator.current
    end
  end
end

Main.new.run
