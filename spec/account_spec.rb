require 'account'

describe Account do

  subject(:account) { described_class.new()}

  describe '#balance' do
    it "starts with a balance of zero" do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#deposit' do
    it 'increases the balance by the amount specified' do
      expect{subject.deposit(10)}.to change{subject.balance}.by(10)
    end

    it 'only allows a positive amount to be added' do
      expect{subject.deposit(-10)}.to raise_error "Cannot process a negative amount"
    end
  end

  describe '#withdraw' do
    before do
      account.deposit(50)
    end

    it 'decreases the balance by the amount specified' do
      expect{subject.withdraw(10)}.to change{subject.balance}.by(-10)
    end

    it 'only allows a positive amount to be withdrawn' do
      expect{subject.withdraw(-10)}.to raise_error "Cannot process a negative amount"
    end

    it 'only cannot withdraw more than current balance' do
      expect{subject.withdraw(60)}.to raise_error "Withdrawal exceeds account balance"
    end

  end

end
