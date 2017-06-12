class Statement
  attr_reader :transactions

  def initialize(transactions)
    @transactions = transactions
    print_statement
  end

  def print_statement
    header
    transactions.each do |transaction|
      if transaction.type == :deposit
        puts format_date(transaction.date) + " || " +
        format_amount(transaction.amount) + " || || " + format_amount(transaction.balance)
      elsif transaction.type == :withdrawal
        puts format_date(transaction.date) + " || || " +
        format_amount(transaction.amount) + " || " + format_amount(transaction.balance)
      end
    end
  end

  private

  def header
    puts "date || credit || debit || balance"
  end

  def format_date(date)
    date.strftime("%e/%m/%Y")
  end

  def format_amount(amount)
    if amount
      '%.2f' % amount
    end
  end

end
