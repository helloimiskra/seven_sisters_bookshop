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
  
  def self.get_school_name_from_text(text)
      return :barnard if text.include?("barnard")
      return :brynmawr if text.include?("brynmawr")
      return :mountholyoke if text.include?("mount")
      return :radcliffe if text.include?("radcliffe")
      return :smith if text.include?("smith")
      return :vassar if text.include?("vassar")
      return :wellesley if text.include?("wellesley")
  end


end
