require 'statement'

describe Statement do
  date = Time.now
  Timecop.freeze(date)
  let(:account) { double :account }
  let(:deposit) { instance_double(Transaction, date: date, type: :deposit, amount: 20, balance: 20) }
  let(:withdrawal) { instance_double(Transaction, date: date, type: :withdrawal, amount: 20, balance: 20) }
  let(:statement_deposit) { described_class.new([deposit]) }
  let(:statement_withdrawal) { described_class.new([withdrawal]) }

  describe '#initialize' do
    it 'takes a list of transactions' do
      expect(statement_deposit.transactions).to include(deposit)
    end
  end

  describe '#print_statement' do
    it 'prints a deposit' do
      header = "date || credit || debit || balance\n"
      allow(deposit).to receive(:balance).and_return(20)
      transaction = "#{date.strftime("%e/%m/%Y")} || 20.00 || || 20.00\n"
      expect { statement_deposit }.to output("#{header}#{transaction}").to_stdout
    end
    it 'prints a withdrawal' do
      header = "date || credit || debit || balance\n"
      transaction = "#{date.strftime("%e/%m/%Y")} || || 20.00 || 20.00\n"
      expect { statement_withdrawal }.to output("#{header}#{transaction}").to_stdout
    end
  end
end
