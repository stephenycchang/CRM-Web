class Rolodex

  def initialize
    @contacts = []
  end

  def create_contact(first_name, last_name, email, note)
    contact = Contact.new(first_name, last_name, email, note)
    @contacts << contact
  end

  def modify_contact(id, new_first_name, new_last_name, new_email, new_note)
    @contacts.each do |contact|
      if contact.id == id
        contact.first_name = new_first_name if new_first_name != nil
        contact.last_name = new_last_name if new_last_name != nil
        contact.email = new_email if new_email != nil
        contact.note = new_note if new_note != nil
      end
    end  
  end

  def show_contacts
    @contacts.each do |contact|
      puts contact
    end
  end

  def delete_contact(id)
    @contacts.delete_if { |c| c.id == id}

  end

  def show_first_name 
    @contacts.each do |contact|
      puts "User #{contact.number}\n#{contact.firstname}"
    end
  end

  def show_last_name
    @contacts.each do |contact|
      puts contact.lastname
    end
  end

  def show_email
    @contacts.each do |contact|
      puts contact.e_mail
    end
  end

  def show_notes
    @contacts.each do |contact|
      puts contact.paper
    end
  end
end
