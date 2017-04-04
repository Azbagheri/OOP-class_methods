class Book

  @@on_shelf = []
  @@on_loan = []

  attr_accessor :due_date

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn

  end

  def borrow
    if self.lent_out?
      puts "false"
    else
      @due_date = Book.current_due_date
      @@on_shelf.delete(self)
      @@on_loan  << self
      return true
  end
end
  def return_to_library
    if lent_out?
      @@on_loan.delete(self)
      @@on_shelf << self
      return true
    else
      return false
    end
  end

  def lent_out?
    @@on_loan.include?("#{@title}")
  end

def self.create(title, author, isbn)
  new_book = Book.new(title, author, isbn)

  @@on_shelf << new_book

  return new_book
end

def self.current_due_date
    today = Time.now
    day = today.day
    month = today.month
    year = today.year
    due_date = Time.local(year, month+1, day)
    puts "The current due date is: #{due_date}."
end

def self.overdue_books
end

def self.browse
  @@on_shelf.sample
end

def self.available
  @@on_shelf
end

def borrowed
  @@on_loan
end

end
