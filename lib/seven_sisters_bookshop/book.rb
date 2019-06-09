class SevenSistersBookshop::Book
  attr_accessor: :title, :author, :price, :book_url, :desc
  def initialize(title)
    @title = title
    @author = author
    @price = price
    @book_url = book_url
    @desc = desc
  end
end
