
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
  
  def self.sort_books_into_schools

    colleges = [
        "Barnard College logo",
        "Bryn Mawr College logo",
        "mount-holyoke-college-2-logo-png-transparent",
        "Radcliffe logo",
        "Smith College logo",
        "Vassar logo",
        "Wellesley logo"
        ]

    book_types = [
        "Audio Books Link",
        "e-books link"
        ]

    item_array = self.scrape_books

    college_books = {
        barnard: [],
        brynmawr: [],
        mountholyoke: [],
        radcliffe: [],
        smith: [],
        vassar: [],
        wellesley: []
      }

    current_school = nil
    is_paperback = true
   
    item_array.map do |item|
      if colleges.include?(item)
        current_school = self.get_school_name_from_text(item)
        is_paperback = true
      end
    end
    
    item_array.map do |item|
      if colleges.include?(item)
        current_school = self.get_school_name_from_text(item)
        is_paperback = true
      elsif book_types.include? item
        is_paperback = false
      elsif item == "paper books link"
        is_paperback = true
      else
        college_books[current_school] << item if is_paperback
      end
    end
    college_books
  end
  
  def self.get_school_name_from_text(text)
    return :barnard if text.include? "Barnard"
    return :brynmawr if text.include? "Bryn"
    return :mountholyoke if text.include? "mount-holyoke-college-2-logo-png-transparent"
    return :radcliffe if text.include? "Radcliffe"
    return :smith if text.include? "Smith"
    return :vassar if text.include? "Vassar"
    return :wellesley if text.include? "Wellesley"
  end

end
