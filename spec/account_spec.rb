require 'account'

describe Account do
  subject(:account) { described_class.new }

  it 'Starts with a balance of 0' do
    expect(account.balance).to eq(0)
  end

  describe '#deposit' do
    it 'Adds the amount to the balance' do
      expect { account.deposit(500) }.to change { account.balance }.by(500)
    end
  end

end
