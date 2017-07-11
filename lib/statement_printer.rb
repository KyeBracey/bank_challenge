# Understands the formatting of transactions and printing of statements
class StatementPrinter
  def print_statement(transactions = [])
    puts 'date || credit || debit || balance'
    puts 'No transaction history' and return if transactions == []
    transactions.each do |transaction|
      puts format_transaction(transaction.information)
    end
  end

  def format_transaction(transaction)
    date = transaction[:date].strftime('%d/%m/%Y')
    transaction = transaction.transform_values do |value|
      format('%.2f', value) if value.is_a? Numeric
    end
    "#{date} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}"
  end
end
