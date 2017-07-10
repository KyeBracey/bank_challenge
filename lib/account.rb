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
                       credit: amount,
                       debit: nil,
                       balance: @balance }
  end

  def withdraw(amount)
    check_balance(amount)
    @balance -= amount
    @transactions << { date: Time.now,
                       credit: nil,
                       debit: amount,
                       balance: @balance }
  end

  def print_statement
    @statement_printer.print_statement(@transactions)
  end

  private
  def check_balance(withdraw_amount)
    raise 'Cannot withdraw - account is empty' if @balance == 0
    if @balance < withdraw_amount
      raise "Cannot withdraw that much - current balance: #{sprintf('%.2f', @balance)}"
    end
  end
end
