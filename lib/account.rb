class Account
  attr_reader :balance

  def initialize(statementPrinter = StatementPrinter.new)
    @statementPrinter = statementPrinter
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

  def print_statement
    @statementPrinter.print_statement
  end
end
