  def to_array
    [id, name, email]
  end 

  def create(name, email)
    # TODO: Instantiate a Contact, add its data to the 'contacts.csv' file, and return it.
    id = @@all.length
    contact = Contact.new(id, name, email)
    CSV.open("./contacts.csv", "a") do |csv|
      puts csv << contact.to_array
    end
  end