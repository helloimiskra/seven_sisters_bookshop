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

  # def add_books(books)
  # end

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
    booklist = doc.css('img').map { |l| l.attr('alt') }
  end

  def self.save
    self.class.all << self
  end

  def self.college_books
    college_books = {
      barnard: [],
      brynmawr: [],
      mountholyoke: [],
      radcliffe: [],
      smith: [],
      vassar: [],
      wellesley: []
    }
  end


  def self.sort_books_into_schools
    booklist = self.scrape_books
    college_books = self.college_books
    audiobooks_index = booklist.each_index.select{|i| booklist[i] == "Audio Books Link" }
    audiobooks_index.map!{|n| n - 1}
    paperbooks_index = booklist.each_index.select{|i| booklist[i] == "paper books link" }
    paperbooks_index.map!{|n| n + 1}
    # binding.pry
    booklist.map.with_index do |t, index|
      if index.between?(paperbooks_index[0], audiobooks_index[0])
        college_books[:barnard] << "#{t}"
      elsif index.between?(paperbooks_index[1], audiobooks_index[1])
        college_books[:brynmawr] << "#{t}"
      elsif index.between?(paperbooks_index[2], audiobooks_index[2])
        college_books[:mountholyoke] << "#{t}"
      elsif index.between?(paperbooks_index[3], audiobooks_index[3])
        college_books[:radcliffe] << "#{t}"
      elsif index.between?(paperbooks_index[4], audiobooks_index[4])
        college_books[:smith] << "#{t}"
      elsif index.between?(paperbooks_index[5], audiobooks_index[5])
        college_books[:vassar] << "#{t}"
      elsif index.between?(paperbooks_index[6], audiobooks_index[6])
        college_books[:wellesley] << "#{t}"
      else
        nil
      end
    end.compact

    # @college_books[:barnard].pop
    # @college_books[:brynmawr].pop
    # @college_books[:mountholyoke].pop
    # @college_books[:radcliffe].pop
    # @college_books[:smith].pop
    # @college_books[:vassar].pop
    # @college_books[:wellesley].pop
    #
    college_books
  end


end
