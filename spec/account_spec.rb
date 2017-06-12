require 'account'

describe Account do
  let(:transaction) { double :transaction }
  let(:statement) { double :statement }
  subject(:account) { described_class.new(statement: statement) }

  describe '#balance' do
    it 'starts with a balance of zero' do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#transactions' do
    it 'starts with an empty list of transactions' do
      expect(subject.transactions).to be_empty
    end
    it 'adds a deposit to the list of transactions' do
      subject.deposit(20)
      expect(subject.transactions).to include(a_kind_of(Transaction))
    end
    it 'adds a withdrawal to the list of transactions' do
      account.deposit(20)
      account.withdraw(20)
      expect(account.transactions[1]).to have_attributes(type: :withdrawal)
    end
  end

  describe '#deposit' do
    it 'increases the balance by the amount specified' do
      expect { subject.deposit(10) }.to change { subject.balance }.by(10)
    end

    it 'only allows a positive amount to be added' do
      expect { subject.deposit(-10) }.to raise_error 'Cannot process a negative amount'
    end
  end

  describe '#withdraw' do
    before do
      account.deposit(50)
    end

    it 'decreases the balance by the amount specified' do
      expect { subject.withdraw(10) }.to change { subject.balance }.by(-10)
    end

    it 'only allows a positive amount to be withdrawn' do
      expect { subject.withdraw(-10) }.to raise_error 'Cannot process a negative amount'
    end

    it 'only cannot withdraw more than current balance' do
      expect { subject.withdraw(60) }.to raise_error 'Withdrawal exceeds account balance'
    end
  end

  describe '#statements' do
    before do
      account.deposit(50)
    end

    it 'prints a statement' do
      expect(statement).to receive(:new).with(subject.transactions)
      subject.print_statement
    end
  end
end
