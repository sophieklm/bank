require_relative 'transaction'

class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    catch_error(amount)
    process_deposit(amount)
  end

  def withdraw(amount)
    catch_error(amount)
    fail 'Withdrawal exceeds account balance' if (@balance - amount) < 0
    process_withdrawal(amount)
  end

  private

  def catch_error(amount)
    fail 'Cannot process a negative amount' if amount < 0
  end

  def process_deposit(amount)
    Transaction.new(:deposit, amount)
    @balance += amount
  end

  def process_withdrawal(amount)
    Transaction.new(:withdrawal, amount)
    @balance -= amount
  end
end
