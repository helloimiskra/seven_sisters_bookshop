require_relative './scraper.rb'
class SevenSistersBookshop::School

  attr_accessor :name, :books, :schools, :booklist, :college_books

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

  def self.save
    self.class.all << self
  end
  
  def self.scrape_schools
    doc = Nokogiri::HTML(open("https://riverdogbookco.com/sevensistersstories/"))
    schools = []
    school_names = doc.css("div.fl-rich-text p strong").text.gsub!(".", "")
    schools << school_names.gsub!("and ", "").split(", ")
    schools.flatten!
    schools
  end
  
  def self.scrape_books
    doc = Nokogiri::HTML(open("https://riverdogbookco.com/sevensistersstories/"))
    binding.pry 
    booklist = doc.css('img').map { |l| l.attr('alt') }
    booklist.delete_if{|x| x == ""}
  end
  
  def self.scrape_books
    doc = Nokogiri::HTML(open("https://riverdogbookco.com/sevensistersstories/"))
    doc.css('div.fl-photo-content.fl-photo-img-jpg a').map.with_index do |b, i|
    books = {
      :title => doc.css('div.fl-photo-content.fl-photo-img-jpg a img').map { |l| l.attr('alt')}[i],
      :book_url => doc.css('div.fl-photo-content.fl-photo-img-jpg a').map { |l| l.attr('href')}[i]
      }
    books
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
  


end
