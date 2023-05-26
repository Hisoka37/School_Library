require './app'

class Main
  MENU_OPTIONS = {
    '1' => { description: 'List all books', action: :list_all_books },
    '2' => { description: 'List all people', action: :list_all_people },
    '3' => { description: 'Create a person', action: :create_person },
    '4' => { description: 'Create a book', action: :create_book },
    '5' => { description: 'Create a rental', action: :create_rental },
    '6' => { description: 'List all rentals for a given person id', action: :list_rentals },
    '7' => { description: 'Exit', action: :exit }
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
        return if option == '7'
      else
        puts 'Please enter a number between 1 and 7'
      end
    end
  end

  private

  def display_menu_options
    puts 'Please choose an option by entering a number:'
    MENU_OPTIONS.each { |key, value| puts "#{key} - #{value[:description]}" }
  end

  def valid_option?(option)
    MENU_OPTIONS.key?(option)
  end

  def execute_option(option)
    action = MENU_OPTIONS[option][:action]
    send(action)
  end

  def list_all_books
    @app.list_all_books
  end

  def list_all_people
    @app.list_all_people
  end

  def create_person
    @app.create_person
  end

  def create_book
    @app.create_book
  end

  def create_rental
    @app.create_rental
  end

  def list_rentals
    @app.list_rentals
  end

  def exit
    puts 'Thank you for using our library ¯\^-^/¯'
  end
end

main = Main.new
main.menu
