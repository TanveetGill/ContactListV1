require 'csv'

# Represents a person in an address book.
# The ContactList class will work with Contact objects instead of interacting with the CSV file directly
class Contact

  @@all = []
  attr_accessor :id, :name, :email
  
  # Creates a new contact object
  # @param name [String] The contact's name
  # @param email [String] The contact's email address
  def initialize(id, name, email)
    # TODO: Assign parameter values to instance variables.
    @id = id
    @name = name
    @email = email
  end

  def to_array
    [id, name, email]
  end

  def to_s
    "#{id}: #{name}, #{email}"
  end
  # Provides functionality for managing contacts in the csv file.
  class << self

    # Opens 'contacts.csv' and creates a Contact object for each line in the file (aka each contact).
    # @return [Array<Contact>] Array of Contact objects
    def all
      # TODO: Return an Array of Contact instances made from the data in 'contacts.csv'.
      CSV.foreach('./contacts.csv') do |row|
        new_contact = Contact.new(row[0],row[1],row[2])
        @@all << new_contact
      end
      @@all
    end

    # Creates a new contact, adding it to the csv file, returning the new contact.
    # @param name [String] the new contact's name
    # @param email [String] the contact's email

    def create(name, email)
      # TODO: Instantiate a Contact, add its data to the 'contacts.csv' file, and return it.
      id = Contact.all.length
      contact = Contact.new(id, name, email)
      CSV.open("./contacts.csv", "a") do |csv|
        csv << contact.to_array
      end
      contact
    end
    
    # Find the Contact in the 'contacts.csv' file with the matching id.
    # @param id [Integer] the contact id
    # @return [Contact, nil] the contact with the specified id. If no contact has the id, returns nil.
    def find(id)
      # TODO: Find the Contact in the 'contacts.csv' file with the matching id.
      Contact.all.find { |contact| contact.id == id}
    end
    
    # Search for contacts by either name or email.
    # @param term [String] the name fragment or email fragment to search for
    # @return [Array<Contact>] Array of Contact objects.
    def search(term)
      # TODO: Select the Contact instances from the 'contacts.csv' file whose name or email attributes contain the search term.
      Contact.all.select { |contact| contact.name.include?(term) || contact.email.include?(term)}
    end

  end

end