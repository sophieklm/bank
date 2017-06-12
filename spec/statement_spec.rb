require 'statement'

describe Statement do
  let(:transactions) { double [{ type: :deposit, amount: 20}]}
  subject { described_class.new(transactions) }

  describe '#initialize' do
    it 'takes a list of transactions' do
      expect(subject.transactions).to eq(transactions)
    end
  end

end
