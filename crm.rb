require 'sinatra'
require './rolodex.rb'
require 'data_mapper'

DataMapper.setup(:default, "sqlite3:database.sqlite3")

class Contact
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :email, String
  property :note, String
end

DataMapper.finalize
DataMapper.auto_upgrade!

#   @@counter = 1000

#   attr_accessor :first_name, :last_name, :email, :note, :id

#   def initialize(counter, first_name, last_name, email, note)
#     @first_name = first_name
#     @last_name = last_name
#     @email = email
#     @note = note
#     @@counter += 1
#     @id = @@counter
#   end

#   def firstname
#     @first_name
#   end

#   def lastname
#     @last_name
#   end

#   def e_mail
#     @email
#   end

#   def paper
#     @note
#   end

#   def number
#     @id
#   end

#   def to_s
#     " ID: #{id} -#{first_name} #{last_name} -  #{email} ---Notes: #{note}"
#   end
# end


# @@rolodex = Rolodex.new

# @@rolodex.create_contact(1001, "Matt", "Holtom", "matt@gmail.com", "ksjdflksajdf")
# @@rolodex.create_contact(1002, "Stephen", "Chang", "stephen@gmail.com", "ksjdflksajdf")

get "/" do
  erb :index  
end

#1.  read all contacts
get '/contacts' do  
  # @contacts = @@rolodex.contacts
  @contacts = Contact.all
  erb :contacts
end

#2.   Create a contact
post '/contacts'  do  
  # @@rolodex.create_contact(params[:counter], params[:first_name],params[:last_name], params[:email], params[:notes])
  contact = Contact.create(
    :first_name => params[:first_name],
    :last_name => params[:last_name],
    :email => params[:email],
    :note => params[:note]
    )
  redirect to ("/contacts")
end

#7.   Return a form for a new contact
get '/contacts/new' do        
  erb :add_contact
end

#3.   Read one contact with that id
get '/contacts/:id' do 
  @contact = Contact.get(params[:id].to_i)
  if @contact
    erb :show_contacts
  else
    raise Sinatra::NotFound
  end
end

#4.   Update the existing contact with that id
put '/contacts/:id' do  
  @@rolodex.modify_contact(params[:id], params[:new_first_name], params[:new_last_name], params[:new_email], params[:new_note])
  redirect to :contacts
end

#5.   Delete the existing contact with that id
delete '/contacts/:id' do  
  @contacts = @@rolodex.delete_contact(params[:id])
  redirect to :contacts
end

#6.   Return a form for updating an existing contact
get '/contacts/:id/edit' do  
  @contact = @@rolodex.find(params[:id])
  erb :modify
end