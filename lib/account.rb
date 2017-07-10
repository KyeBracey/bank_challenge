class Account
  attr_reader :balance

  def initialize(statement_printer = StatementPrinter.new)
    @statement_printer = statement_printer
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

  def print_statement
    @statement_printer.print_statement
  end
end
