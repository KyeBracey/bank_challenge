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
    transaction = transaction.transform_values do |value|
      sprintf('%.2f', value) if value.is_a? Numeric
    end
    "#{date} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}"
  end
end
