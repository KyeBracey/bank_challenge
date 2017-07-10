require_relative 'statement_printer'

class Account
  attr_reader :balance

  def initialize(statement_printer = StatementPrinter.new)
    @statement_printer = statement_printer
    @transactions = []
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
    @transactions << { date: Time.now,
                       credit: nil,
                       debit: amount,
                       balance: @balance }
  end

  def withdraw(amount)
    @balance -= amount
  end

  def print_statement
    @statement_printer.print_statement(@transactions)
  end
end
