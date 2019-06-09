class SevenSistersBookshop::School
  attr_accessor :name, :books

  def self.all
    # puts <<-DOC 
    # 1. Barnard College
    # 2. Bryn Mawr College
    # 3. Mount Holyoke College
    # 4. Radcliffe College
    # 5. Smith College
    # 6. Vassar College
    # 7. Wellesley College
    #
    # DOC
    school_1 = self.new
    school_1.name = "Barnard College"
    school_1.books = "book_one"

    school_2 = self.new
    school_2.name = "Bryn Mawr College"
    school_2.books = "book_one"

    school_3 = self.new
    school_3.name = "Mount Holyoke College"
    school_3.books = "book_one"

    school_4 = self.new
    school_4.name = "Radcliffe College"
    school_4.books = "book_one"

    school_5 = self.new
    school_5.name = "Smith College"
    school_5.books = "book_one"

    school_6 = self.new
    school_6.name = "Vassar College"
    school_6.books = "book_one"

    school_7 = self.new
    school_7.name = "Wellesley College"
    school_7.books = "book_one"

    [school_1, school_2, school_3, school_4, school_5, school_6, school_7]
    # should return all of the seven sister colleges
  end
end
