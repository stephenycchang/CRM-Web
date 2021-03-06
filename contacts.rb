class Contact

  @@counter = 1000

  attr_accessor :first_name, :last_name, :email, :note, :id

  def initialize(counter, first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @@counter += 1
    @id = @@counter
  end

  def firstname
    @first_name
  end

  def lastname
    @last_name
  end

  def e_mail
    @email
  end

  def paper
    @note
  end

  def number
    @id
  end

  def to_s
    " ID: #{id} -#{first_name} #{last_name} -  #{email} ---Notes: #{note}"
  end
end
