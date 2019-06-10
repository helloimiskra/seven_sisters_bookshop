
class SevenSistersBookshop::School
  attr_accessor :name, :books

  def initialize(name)
    @name = name
    @books = []
  end

  def self.all
    schools = self.scrape_schools
    schools.map do |school|
      school = self.new(school)
    end
  end

  def self.scrape_schools
    doc = Nokogiri::HTML(open("https://riverdogbookco.com/sevensistersstories/"))
    # url = Nokogiri::HTML(open("https://shop.riverdogbookco.com/book/9780553375930"))
  #  binding.pry
    schools = []
    school_names = doc.css("div.fl-rich-text p strong").text.gsub!(".", "")
    schools << school_names.gsub!("and ", "").split(", ")
    schools.flatten!
    schools
  end

  def self.save
    self.class.all << self
  end

  # def self.create(name)
  #   school = School.new(name)
  #   school.save
  #   return school
  # end



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
