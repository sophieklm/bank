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
      expect{subject.deposit(10)}.to change{subject.balance}.by(10);
    end
  end

end
