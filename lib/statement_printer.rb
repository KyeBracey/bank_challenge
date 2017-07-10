class StatementPrinter
  def print_statement(transactions = [])
    puts 'date || credit || debit || balance'
    if transactions == []
      puts 'No transaction history'
      return
    end
    transactions.each do |transaction|
      puts format_transaction(transaction)
    end
  end

  def format_transaction(transaction)
    date = transaction[:date].strftime('%d/%m/%Y')
    credit = transaction[:credit].nil? ? nil : sprintf('%.2f', transaction[:credit])
    debit = transaction[:debit].nil? ? nil : sprintf('%.2f', transaction[:debit])
    balance = sprintf('%.2f', transaction[:balance])
    "#{date} || #{credit} || #{debit} || #{balance}"
  end
end
