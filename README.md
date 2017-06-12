## Bank

A command line banking app written in Ruby, implementing Object Oriented Design with Test Driven Development

User Stories
```
As a client
So that I can have an environment for storing money
I want to be able to have a bank account

As a client
So that I can store my money virtually
I want to be able to make a deposit

As a client
So that I can use the money in my bank account
I want to be able to make a withdrawal

As a client
So that I can keep track of my spending
I want to be able to see a list of transactions

```

Setup and Usage
---
```
$ git clone git@github.com:sophieklm/bank.git
$ cd bank
$ bundle
$ rspec
$ pry

> require './lib/account.rb'
> account = Account.new
> account.deposit(20)
> account.withdraw(10)
> account.print_statement

```

### Requirements

* You should be able to interact with the your code via a REPL like IRB or the JavaScript console.
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012
**And** a deposit of 2000 on 13-01-2012
**And** a withdrawal of 500 on 14-01-2012
**When** she prints her bank statement
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
