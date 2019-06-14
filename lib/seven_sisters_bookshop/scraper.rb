class SevenSistersBookshop::Scraper

  # def self.scrape_schools
  #   doc = Nokogiri::HTML(open("https://riverdogbookco.com/sevensistersstories/"))
  #   schools = {}
  #   school_names = doc.css("div.fl-rich-text p strong").text.gsub!(".", "")
  #   schools[sc] << school_names.gsub!("and ", "").split(", ")
  #   schools.flatten!
  #   schools
  # end
  
  def self.scrape_books
    doc = Nokogiri::HTML(open("https://riverdogbookco.com/sevensistersstories/"))
    
    unwanted = [
    "River Dog Book Co.",
    "Seven Sisters Alumnae Association logo",
    "paper books link",
    "Audio Books Link",
    "e-books link"
    ]
    
    
  booklist = doc.css('img').map { |l| l.attr('alt')}
  booklist.delete_if{|x| unwanted.include? x}
  
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
    item_array.map do |item|
      if colleges.include? item
        current_school = self.get_school_name_from_text(item)
        college_books[current_school]
      else
        college_books[current_school] << item
      end
    end
    
    
  
    binding.pry 
    doc.css('div.fl-photo-content.fl-photo-img-jpg a').map.with_index do |b, i|
    books = {
      :title => doc.css('div.fl-photo-content.fl-photo-img-jpg a img').map { |l| l.attr('alt')}[i],
      :book_url => doc.css('div.fl-photo-content.fl-photo-img-jpg a').map { |l| l.attr('href')}[i]
      }
    books
  end
  
  booklist.map do |item|
      if colleges.include? item
        current_school = self.get_school_name_from_text(item)
        college_books[current_school]
      else
        doc.css('div.fl-photo-content.fl-photo-img-jpg a').map.with_index do |b, i|
          books = { Book.new (
            book.title =)
            :title => doc.css('div.fl-photo-content.fl-photo-img-jpg a img').map { |l| l.attr('alt')}[i],
            :book_url => doc.css('div.fl-photo-content.fl-photo-img-jpg a').map { |l| l.attr('href')}[i]
          }
          college_books[current_school] << books
        end
      end
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
  
  
  
  
  
    college_books
  end
  
  
  
  
  
  
   def self.scrape_book_page(book_url)
    url = Nokogiri::HTML(open(book_url))
    info_details = {
      :title => url.css("h1").text.gsub(" (Paperback)", ""),
      :author => url.css("div.abaproduct-authors a").text,
      :price => url.css("div.abaproduct-price").text.strip,
      :desc => url.css("div.abaproduct-body").text
      }
      info_details
    end
  end
  
end
