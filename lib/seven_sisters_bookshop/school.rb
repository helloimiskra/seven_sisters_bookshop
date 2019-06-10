
class SevenSistersBookshop::School
  attr_accessor :name, :books

  def initialize(name)
    @name = name
    @books = []
  end

  def self.all
    # SevenSistersBookshop::SchoolScraper.new("https://riverdogbookco.com/sevensistersstories/")
    #scrape site and then return schools
    schools = self.scrape_schools
    # schools.map do |school|
    #   college = School.new(school)
    # end
    # #scrape blog site
    #
    # # puts <<-DOC
    # # 1. Barnard College
    # # 2. Bryn Mawr College
    # # 3. Mount Holyoke College
    # # 4. Radcliffe College
    # # 5. Smith College
    # # 6. Vassar College
    # # 7. Wellesley College
    # #
    # # DOC
    #
    #
    # school_1 = self.new
    # school_1.name = "Barnard College"
    # school_1.books = "book_one"
    #
    # school_2 = self.new
    # school_2.name = "Bryn Mawr College"
    # school_2.books = "book_one"
    #
    # school_3 = self.new
    # school_3.name = "Mount Holyoke College"
    # school_3.books = "book_one"
    #
    # school_4 = self.new
    # school_4.name = "Radcliffe College"
    # school_4.books = "book_one"
    #
    # school_5 = self.new
    # school_5.name = "Smith College"
    # school_5.books = "book_one"
    #
    # school_6 = self.new
    # school_6.name = "Vassar College"
    # school_6.books = "book_one"
    #
    # school_7 = self.new
    # school_7.name = "Wellesley College"
    # school_7.books = "book_one"
    #
    # [school_1, school_2, school_3, school_4, school_5, school_6, school_7]
    # should return all of the seven sister colleges
  end

  def self.scrape_schools
    doc = Nokogiri::HTML(open("https://riverdogbookco.com/sevensistersstories/"))
    url = Nokogiri::HTML(open("https://shop.riverdogbookco.com/book/9780553375930"))
   binding.pry
    schools = []
    school_names = doc.css("div.fl-rich-text p strong").text.gsub!(".", "")
    schools << school_names.gsub!("and ", "").split(", ")
    schools.flatten!
  end

  def self.save
    self.class.all << self
  end

  def self.create(name)
    school = new(name)
    school.save
    return school
  end



  # doc.css("div.fl-photo-content.fl-photo-img-jpg").css('alt').text

  #book urls doc.css('div.fl-photo-content.fl-photo-img-jpg a').map{ |link| link['href'].include?('shop')? link['href'] : nil }.compact

  #book author url.css("div.abaproduct-authors a").text
  #book price url.css("div.abaproduct-price").text.strip

  #book desc 1 url.css("div.abaproduct-body").text
  #book desc 2 url.css("div.abaproduct-body b").first.text
  # def self.scrape_books
  #   url = Nokogiri::HTML(open(https://shop.riverdogbookco.com/book/9780812983470)
  # end




end
