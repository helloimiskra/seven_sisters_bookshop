
class SevenSistersBookshop::Book
  attr_accessor :title, :author, :price, :book_url, :desc, :school
  attr_reader :name

  @@all = []

  def initialize(book_url = nil, title = nil, author = nil, price = nil, desc = nil)
    @title = title
    @author = author
    @price = price
    @book_url = book_url
    @desc = desc
    @school = school
  end

  def self.create_by_url(book_url)
    binding.pry
    url = Nokogiri::HTML(open(book_url))
    book = self.new(book_url)
    book.title = url.css("h1").text.gsub(" (Paperback)", "")
    book.author = url.css("div.abaproduct-authors a").text
    book.price = url.css("div.abaproduct-price").text.strip
    book.desc = url.css("div.abaproduct-body").text
    book.save
  end

  def self.all
    @@all
  end

  def self.save
    @@all << self
  end

end
