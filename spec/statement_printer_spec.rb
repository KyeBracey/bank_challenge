require 'statement_printer'

describe StatementPrinter do
  subject(:statement_printer) { described_class.new }
  let(:today) { Time.now }
  describe '#print_statement' do
    it 'Prints out "No transaction history" when passed an empty array' do
      expect(STDOUT).to receive(:puts)
        .with('date || credit || debit || balance')
      expect(STDOUT).to receive(:puts)
        .with('No transaction history')
      statement_printer.print_statement
    end

    it 'Handles printing a statement with one transaction' do
      pending('Pending while committing #format_transaction')
      expect(STDOUT).to receive(:puts)
        .with('date || credit || debit || balance')
      expect(STDOUT).to receive(:puts)
        .with("#{Time.now.strftime('%d/%m/%Y')} || 500.00 ||  || 500.00")
      statement_printer.print_statement([{date: today,
                                          credit: 500,
                                          debit: nil,
                                          balance: 500}])
    end
  end

  describe '#format_transaction' do
    it 'Formats the date and monetary amounts nicely' do
      transaction = { date: today, credit: 500, debit: nil, balance: 500 }
      expect(statement_printer.format_transaction(transaction)).to eq("#{Time.now.strftime('%d/%m/%Y')} || 500.00 ||  || 500.00")
    end
  end
end
