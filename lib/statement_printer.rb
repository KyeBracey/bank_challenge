class StatementPrinter
  def print_statement(transactions = [])
    puts 'date || credit || debit || balance'
    if transactions == []
      puts 'No transaction history'
    else

    end
  end

  def format_transaction(transaction)
    date = transaction[:date].strftime('%d/%m/%Y')
    credit = sprintf('%.2f', transaction[:credit]) unless transaction[:credit].nil?
    debit = sprintf('%.2f', transaction[:debit]) unless transaction[:debit].nil?
    balance = sprintf('%.2f', transaction[:balance])
    "#{date} || #{credit} || #{debit} || #{balance}"
  end
end
