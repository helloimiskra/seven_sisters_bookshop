require_relative './school.rb'
require_relative './book.rb'
require_relative './scraper.rb'
class SevenSistersBookshop::CLI

  attr_accessor :name, :schools, :books

  def call
    puts "\nWelcome to the Seven Sisters' Bookshop!\n\nPlease choose a college: \n"
    list_schools
    menu
    # goodbye
  end

  def list_schools
    puts "The Seven Sisters"
    @schools = SevenSistersBookshop::School.all
    @schools.each.with_index(1) do |school, i|
      puts "#{i}. #{school.name}"
    end
  end

  def list_books
    @college_books = SevenSistersBookshop::School.sort_books_into_schools
    @college_books.each do |college, books|
      books.each.with_index(1) do |book, i|
        puts "#{i}. #{book}"
      end
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Choose the number of the school you want to read from, type list to see the school's list again, or type exit:"
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i < 8
        the_school = @schools[input.to_i-1]
        puts "#{the_school.name}'s Stories"
        list_books[the_school.name].each.with_index(1) do |book, i|
          puts "#{i}. #{book}"
        end
        
      elsif input === "list"
        list_schools
      elsif input === "exit"
        goodbye
      else
        puts "Not sure which school you want? Type 'list' or 'exit' to continue."
      end
    end
  end


  def goodbye
    puts "Come back another day for more Seven Sisters Stories. Goodbye!"
  end
end
