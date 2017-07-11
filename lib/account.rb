require_relative 'statement_printer'

# Understands the deposit/withdrawal of funds and recording of transactions
class Account
  attr_reader :balance

  def initialize(statement_printer = StatementPrinter.new)
    @statement_printer = statement_printer
    @transactions = []
    @balance = 0.0
  end

  def deposit(amount)
    @balance = (balance + amount).round(2)
    @transactions << Transaction.new(Time.now, amount, nil, @balance)
  end

  def withdraw(amount)
    check_balance(amount)
    @balance = (balance - amount).round(2)
    @transactions << Transaction.new(Time.now, nil, amount, @balance)
  end

  def print_statement
    @statement_printer.print_statement(@transactions)
  end

  private

  def check_balance(withdraw_amount)
    fail 'Cannot withdraw - account is empty' if @balance == 0
    return unless @balance < withdraw_amount
    fail "Cannot withdraw that much. Balance: #{format('%.2f', @balance)}"
  end
end
