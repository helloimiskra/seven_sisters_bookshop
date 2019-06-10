class SevenSistersBookshop::Book
  attr_accessor: :title, :author, :price, :book_url, :desc, :school

  @@all = []

  def initialize(title = nil, author = nil, price = nil, book_url = nil, desc = nil)
    @title = title
    @author = author
    @price = price
    @book_url = book_url
    @desc = desc
  end

  def create_by_url(book_url)
    url = Nokogiri::HTML(open(book_url))
    Book.new(book_url)
    self.title = url.css("h1").text.gsub(" (Paperback)", "")
    self.author = url.css("div.abaproduct-authors a").text
    self.price = url.css("div.abaproduct-price").text.strip
    self.desc = url.css("div.abaproduct-body").text
    save
  end

  def self.all
    @@all
  end

  def self.save
    @@all << self
  end

end
