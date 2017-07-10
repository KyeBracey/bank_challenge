require 'statement_printer'

describe StatementPrinter do
  subject(:statement_printer) { described_class.new }
  let(:today) { Time.now }
  let(:deposit_500) { { date: today, credit: 500, debit: nil, balance: 500 }  }
  let(:withdraw_500) { { date: today, credit: nil, debit: 500, balance: 0 } }

  describe '#print_statement' do
    it 'Prints out "No transaction history" when passed an empty array' do
      expect(STDOUT).to receive(:puts)
        .with('date || credit || debit || balance')
      expect(STDOUT).to receive(:puts)
        .with('No transaction history')
      statement_printer.print_statement
    end

    it 'Handles printing a statement with one transaction' do
      expect(STDOUT).to receive(:puts)
        .with('date || credit || debit || balance')
      expect(STDOUT).to receive(:puts)
        .with("#{Time.now.strftime('%d/%m/%Y')} || 500.00 ||  || 500.00")
      statement_printer.print_statement([deposit_500])
    end

    it 'Handles printing a statement with multiple transactions' do
      expect(STDOUT).to receive(:puts)
        .with('date || credit || debit || balance')
      expect(STDOUT).to receive(:puts)
        .with("#{Time.now.strftime('%d/%m/%Y')} || 500.00 ||  || 500.00")
      expect(STDOUT).to receive(:puts)
        .with("#{Time.now.strftime('%d/%m/%Y')} ||  || 500.00 || 0.00")
      statement_printer.print_statement([deposit_500, withdraw_500])
    end
  end

  describe '#format_transaction' do
    it 'Formats the date and monetary amounts nicely' do
      transaction = { date: today, credit: 500, debit: nil, balance: 500 }
      expect(statement_printer.format_transaction(transaction)).to eq("#{Time.now.strftime('%d/%m/%Y')} || 500.00 ||  || 500.00")
    end
  end
end
