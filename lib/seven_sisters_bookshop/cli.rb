class SevenSistersBookshop::CLI

  def call
    puts "\nWelcome to the Seven Sisters' Bookshop!\n\nPlease choose a college: \n"
    list_schools
    menu
    goodbye
  end

  def list_schools
    puts <<-DOC
    1. Barnard College
    2. Bryn Mawr College
    3. Mount Holyoke College
    4. Radcliffe College
    5. Smith College
    6. Vassar College
    7. Wellesley College

    DOC
  end

  def menu
    puts "Choose the number of the school you'd want to read from, type list to see the school's list again, or type exit to exit:"
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "1"
        puts "Books from Barnard College..."
      when "2"
        puts "Books from Bryn Mawr College..."
      when "3"
        puts "Books from Mount Holyoke College..."
      when "4"
        puts "Books from Radcliffe College..."
      when "5"
        puts "Books from Smith College..."
      when "6"
        puts "Books from Vassar College..."
      when "7"
        puts "Books from Wellesley College..."
      when "list"
        list_schools
      else
        puts "Not sure which school you want? Type 'list' or 'exit' to continue."
      end
    end
  end


  def goodbye
    puts "Come back another day for more Seven Sisters Stories. Goodbye!"
  end
end
