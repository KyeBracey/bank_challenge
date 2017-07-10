class StatementPrinter
  def print_statement(transactions = [])
    puts 'date || credit || debit || balance'
    puts 'No transaction history' if transactions == []
  end
end
