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
    "e-books link",
    "paper books link"
    ]

item_array = booklist

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
        current_school = get_school_name_from_text(item)
        is_paperback = true
    elsif book_types == "paper books link"
        is_paperback = true
    elsif book_types.include? item
        is_paperback = false
    else
        college_books[current_school] << item if is_paperback
    end
  end


  current_school = get_school_name_from_text(item)
    elsif book_types.include? item
        is_paperback = false
    elsif book_types == "paperbooks"
        is_paperback = true
    else
        Book.new(item.css("titlestuff"), item.css("urlstuff"), current_school) if is_paperback
    end

end




def get_school_name_from_text(text)
    return :barnard if text.include? "barnard"
    return :brynmawr if text.include? "bryn mawr"
    return :mountholyoke if text.include? "mount"
    return :radcliffe if text.include? "radcliffe"
    return :smith if text.include? "smith"
    return :vassar if text.include? "vassar"
    return :wellesley if text.include? "wellesley"
end

audiobooks_index = booklist.each_index.select{|i| booklist[i] == "Audio Books Link" }
paperbooks_index = booklist.each_index.select{|i| booklist[i] == "paper books link" }

combined = audiobooks_index + paperbooks_index
combined.sort!
combined_sorted = combined.each_slice(2).to_a
#[[3, 28], [63, 79], [100, 143], [189, 209], [233, 306], [375, 395], [426, 450]]



booklist.map.with_index do |t, index|
    if index.between?(paperbooks_index[0], audiobooks_index[0])
      t
    elsif index.between?(paperbooks_index[1], audiobooks_index[1])
      t
    elsif index.between?(paperbooks_index[2], audiobooks_index[2])
      t
    elsif index.between?(paperbooks_index[3], audiobooks_index[3])
      t
    elsif index.between?(paperbooks_index[4], audiobooks_index[4])
      t
    elsif index.between?(paperbooks_index[5], audiobooks_index[5])
      t
    elsif index.between?(paperbooks_index[6], audiobooks_index[6])
      t
    else
      nil
    end
  end.compact


current_school = nil
is_paperback = true
item_array.each do |item|
    if colleges.include? item.css("https://riverdogbookco.com/sevensistersstories/")
        current_school = get_school_name_from_text(item)
    elsif book_types.include? item
        is_paperback = false
    elsif book_types == "paperbooks"
        is_paperback = true
    else
        Book.new(item.css("titlestuff"), item.css("urlstuff"), current_school) if is_paperback
    end

end






def get_school_name_from_text(text)

    return :barnard if text.include? "barnard"
    return :smith if text.include? "smith"
end


  # booklist_one = booklist.map do |book|
  #     begin
  #       book
  #     end while book != "Audio Books Link"
  #   end
  # end
  #       break
  #     else
  #       book
  #     end
  #   end
  # end
  #     else
  #       book
  #     end
  #     i += 1
  #   end
  # end
  #
  #   until book.include?("Audio Books Link") == true
  #     book
  #   end
  # end
#   def self.scrape_books
#     url = Nokogiri::HTML(open(""))
# take booklist:
#     booklist = doc.css('img').map { |l| l.attr('alt') }
# find where audiobooks start booklist.find_index("Audio Books Link")
# slice at those two points (from paperbacks)
# create books as empty array
# books << booklist.slice!(4..27)
# school #1 titles
# display list
#     booklist.map!{|title| title.include?('by') ? title : nil}.compact!


# booklist.each_with_index do |title, i|
#   title[3..28]
# end
# end
# # titles.map! do |title|
#          if title.include?('ebook')
#
#                 nil
#                  else
#                         title
#                          end
#                         end.compact!
#
# titles.map! do |title|
#    if title.include?('audiobook')
#     nil
#    else
#      title
#   end end.compact!
#
#


  # doc.css("div.fl-photo-content.fl-photo-img-jpg a href").first.text

  #book urls doc.css('div.fl-photo-content.fl-photo-img-jpg a').map{ |link| link['href'].include?('shop')? link['href'] : nil }.compact

# doc.css('div.fl-photo-content.fl-photo-img-jpg a').map{ |link| link['alt']}
# doc.css('img').map { |l| l.attr('alt') }
# titles = doc.css('div.fl-photo-content.fl-photo-img-jpg').map{ |i| i['alt'] }
#
# <Nokogiri::XML::Attr:0x1895200 name="alt" value="The Rhythm of Memory ebook">,
#
# document = Nokogiri::HTML.parse(open('https://riverdogbookco.com/sevensistersstories/'))
#
# tags        = document.xpath("//alt").value
#
# # narrows titles down:
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

# # doc.css("div.fl-col-group.fl-node").map { |l| l.attr('alt') }
