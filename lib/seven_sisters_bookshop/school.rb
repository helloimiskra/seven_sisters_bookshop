
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

  def add_books(books)
  end
  def self.scrape_schools
    doc = Nokogiri::HTML(open("https://riverdogbookco.com/sevensistersstories/"))
    binding.pry
    schools = []
    school_names = doc.css("div.fl-rich-text p strong").text.gsub!(".", "")
    schools << school_names.gsub!("and ", "").split(", ")
    schools.flatten!
    schools
  end

  def self.save
    self.class.all << self
  end

  def self.scrape_books
    url = Nokogiri::HTML(open(""))
    booklist = doc.css('img').map { |l| l.attr('alt') }
    booklist.map!{|title| title.include?('by') ? title : nil}.compact!

titles.map! do |title|
         if title.include?('ebook')

                nil
                 else
                        title
                         end
                        end.compact!

titles.map! do |title|
   if title.include?('audiobook')
    nil
   else
     title
  end end.compact!




  # doc.css("div.fl-photo-content.fl-photo-img-jpg a href").first.text

  #book urls doc.css('div.fl-photo-content.fl-photo-img-jpg a').map{ |link| link['href'].include?('shop')? link['href'] : nil }.compact

doc.css('div.fl-photo-content.fl-photo-img-jpg a').map{ |link| link['alt']}
doc.css('img').map { |l| l.attr('alt') }
titles = doc.css('div.fl-photo-content.fl-photo-img-jpg').map{ |i| i['alt'] }

<Nokogiri::XML::Attr:0x1895200 name="alt" value="The Rhythm of Memory ebook">,

document = Nokogiri::HTML.parse(open('https://riverdogbookco.com/sevensistersstories/'))

tags        = document.xpath("//alt").value

# narrows titles down:
# titles.map! do |title|
#   if title.include?('by')
#     title
#   else
#     nil
#   end
# end.compact
  #book author url.css("div.abaproduct-authors a").text
  #book price url.css("div.abaproduct-price").text.strip

  #book desc 1 url.css("div.abaproduct-body").text
  #book desc 2 url.css("div.abaproduct-body b").first.text
  # def self.scrape_books
  #   url = Nokogiri::HTML(open(https://shop.riverdogbookco.com/book/9780812983470)
  # end




end
