require './app'

class Main
  MENU_OPTIONS = {
    '1' => :list_all_books,
    '2' => :list_all_people,
    '3' => :create_person,
    '4' => :create_book,
    '5' => :create_rental,
    '6' => :list_rentals,
    '7' => :exit
  }.freeze

  def initialize
    @app = App.new
  end

  def menu
    puts 'Welcome to the School Library App:'

    loop do
      display_menu_options
      option = gets.chomp

      if valid_option?(option)
        execute_option(option)
      else
        puts 'Please enter a number between 1 and 7'
      end
    end
  end

  private

  def display_menu_options
    puts 'Please choose an option by entering a number:'
    MENU_OPTIONS.each { |key, value| puts "#{key} - #{option_description(value)}" }
  end

  def option_description(option)
    case option
    when :list_all_books
      'List all books'
    when :list_all_people
      'List all people'
    when :create_person
      'Create a person'
    when :create_book
      'Create a book'
    when :create_rental
      'Create a rental'
    when :list_rentals
      'List all rentals for a given person id'
    when :exit
      'Exit'
    end
  end

  def valid_option?(option)
    MENU_OPTIONS.keys.include?(option)
  end

  def execute_option(option)
    case MENU_OPTIONS[option]
    when :exit
      puts 'Thank you for using our library ¯\^-^/¯'
      exit
    else
      @app.send(MENU_OPTIONS[option])
    end
  end
end

main = Main.new
main.menu
