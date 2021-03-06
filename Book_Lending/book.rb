class Book

  @@on_shelf = []
  @@on_loan = []

  attr_reader :title, :author, :isbn
  attr_accessor :due_date

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
   @due_date = nil
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
      @due_date = nil
      return true
    else
      return false
    end
  end

  def lent_out?
    @@on_loan.include?(self)
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
    return due_date
  end

  def self.overdue_books
    overdues = @@on_loan.select do |book|
      book.due_date < (Time.now)
    end
    return overdues
  end

  def self.browse
    @@on_shelf.sample
  end

  def self.available
    @@on_shelf
    puts "There are #{@@on_shelf.length} books available in the library."
  end

  def self.borrowed
    @@on_loan
    puts "There are #{@@on_loan.length} books on loan."
  end

end


sister_outsider = Book.create("Sister Outsider", "Audre Lorde", "9781515905431")
aint_i = Book.create("Ain't I a Woman?", "Bell Hooks", "9780896081307")
if_they_come = Book.create("If They Come in the Morning", "Angela Y. Davis", "0893880221")
puts Book.browse.inspect
puts Book.available.inspect
puts sister_outsider.lent_out?
puts sister_outsider.borrow
puts sister_outsider.lent_out?
puts sister_outsider.borrow 
puts sister_outsider.due_date
