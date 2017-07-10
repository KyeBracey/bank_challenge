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

  describe '#withdraw' do
    it 'Deducts the amount from the balance' do
      account.deposit(500)
      expect { account.withdraw(500) }.to change { account.balance }.by(-500)
    end

    it 'Raises an error when trying to withdraw from an empty account' do
      expect { account.withdraw(1) }.to raise_error('Cannot withdraw - account is empty')
    end
  end
end
