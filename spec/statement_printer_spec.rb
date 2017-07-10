require 'statement_printer'

describe StatementPrinter do
  subject(:statementPrinter) { described_class.new }
  describe '#print_statement' do
    it 'Prints out "No transaction history" when passed an empty array' do
      expect(STDOUT).to receive(:puts).with('date || credit || debit || balance')
      expect(STDOUT).to receive(:puts).with('No transaction history')
      statementPrinter.print_statement
    end
  end
end
