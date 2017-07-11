# Understands the recording and showing of transaction information
class Transaction
  attr_reader :information

  def initialize(date, credit, debit, balance)
    @information = { date: date,
                     credit: credit,
                     debit: debit,
                     balance: balance }
  end
end
