require 'account'
require 'statement_printer'

describe 'Statement Printing' do
  let(:account) { Account.new }

  it 'Statement can be printed by calling the method on Account' do
    expect(STDOUT).to receive(:puts)
      .with('date || credit || debit || balance')
    expect(STDOUT).to receive(:puts)
      .with('No transaction history')
    account.print_statement
  end

  it 'Statement with one transaction can be printed' do
    account.deposit(500)
    expect(STDOUT).to receive(:puts)
      .with('date || credit || debit || balance')
    expect(STDOUT).to receive(:puts)
      .with("#{Time.now.strftime('%d/%m/%Y')} || 500.00 ||  || 500.00")
    account.print_statement
  end

  it 'Statement with multiple transactions can be printed' do
    account.deposit(500)
    account.withdraw(500)
    expect(STDOUT).to receive(:puts)
      .with('date || credit || debit || balance')
    expect(STDOUT).to receive(:puts)
      .with("#{Time.now.strftime('%d/%m/%Y')} || 500.00 ||  || 500.00")
    expect(STDOUT).to receive(:puts)
      .with("#{Time.now.strftime('%d/%m/%Y')} ||  || 500.00 || 0.00")
    account.print_statement
  end

  it 'Handles transactions with decimal values' do
    account.deposit(90.93)
    account.withdraw(67)
    expect(STDOUT).to receive(:puts)
      .with('date || credit || debit || balance')
    expect(STDOUT).to receive(:puts)
      .with("#{Time.now.strftime('%d/%m/%Y')} || 90.93 ||  || 90.93")
    expect(STDOUT).to receive(:puts)
      .with("#{Time.now.strftime('%d/%m/%Y')} ||  || 67.00 || 23.93")
    account.print_statement
  end
end
