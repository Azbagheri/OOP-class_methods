class BankAccount
  @@interest_rate = 0.01
  @@accounts = []

  def self.accounts
   @@accounts
  end

  def self.interest_rate
   @@interest_rate
  end

  def self.create
   BankAccount.new
  end

  def self.total_funds
   sum = 0
   @@accounts.each do |account|
    sum = sum + account.balance
   end
   "Total fund is #{sum}"
  end

  def self.interest_time
   @@accounts.each do |account|
    account.balance = account.balance * (1 + @@interest_rate)
   end
  end

  attr_accessor :balance

  def initialize
   @balance = 0
   @@accounts << self
  end

  def deposit(amount)
   @balance = @balance + amount
  end

  def withdraw(amount)
   if @balance - amount < 0
     puts "Action not allowed. Your balance would go less than zero"
   else
     @balance = @balance - amount
   end
  end
end

my_account = BankAccount.create
your_account = BankAccount.create
puts my_account.balance
puts your_account.balance
BankAccount.total_funds
my_account.deposit(200)
your_account.deposit(500)
puts my_account.balance
puts your_account.balance
BankAccount.total_funds
BankAccount.interest_time
puts my_account.balance
puts your_account.balance
BankAccount.total_funds
my_account.withdraw(100)
puts my_account.balance
