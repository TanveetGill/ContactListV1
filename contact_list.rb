require_relative 'contact'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList

	def initialize
	end
  # TODO: Implement user interaction. This should be the only file where you use `puts` and `gets`.

  	def self.menu
  		puts "Here is a list of available commands:
  		new - Create a new contact
  		list - List all contacts
  		show - Show a contact
  		search - Search contacts"
  	end

  	def self.user_input
  		puts ARGV[0]
  		case ARGV[0]

  		when "new"
  			puts "Contact Name:"
  			name = STDIN.gets.chomp
  			puts "Contact Email:"
  			email = STDIN.gets.chomp
  			puts Contact.create(name, email)
  		when "list"
  			puts Contact.all
  		when "show"
  			puts "Enter ID:"
  			id = STDIN.gets.chomp
  			puts Contact.find(id)
  		when "search"
  			puts "Search for Contact:"
  			term = STDIN.gets.chomp
  			Contact.search(term).each do |contact|
  				puts contact
  			end
  		else
  			"Not an input"
  		end
  			
  	end

end

ContactList.menu
ContactList.user_input