class SevenSistersBookshop::Scraper

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
    # binding.pry
    books = []
    books << booklist.slice!(4..27)
    # binding.pry
    books.flatten!
  end

  def get_school_name_from_text(text)
      return :barnard if text.include?("barnard")
      return :brynmawr if text.include?("brynmawr")
      return :mountholyoke if text.include?("mount")
      return :radcliffe if text.include?("radcliffe")
      return :smith if text.include?("smith")
      return :vassar if text.include?("vassar")
      return :wellesley if text.include?("wellesley")
  end

end
