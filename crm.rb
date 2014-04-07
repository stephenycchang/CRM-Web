require 'sinatra'
require './contacts.rb'
require './rolodex.rb'
# require 'data_mapper'

# DataMapper.setup(:default, "sqlite3:database.sqlite3")

@@rolodex = Rolodex.new

@@rolodex.create_contact(1001, "Matt", "Holtom", "matt@gmail.com", "ksjdflksajdf")
@@rolodex.create_contact(1002, "Stephen", "Chang", "stephen@gmail.com", "ksjdflksajdf")

get "/" do
  erb :index  
end

# get "/delete" do
#   @contacts = @@rolodex.show_contacts
#   erb :delete
# end

# get "/new" do
#   erb :add_contact
# end

# get "/contacts" do
#   @contacts = @@rolodex.contacts
#   erb :contacts
# end

# get "/modify" do
#   @contacts = @@rolodex.show_contacts
#   erb :modify
# end

# post "/new" do
#   erb :add_contact
# end 

# post "/delete" do
#   @@rolodex.delete_contact(params[:id])
#   redirect to ("/contacts")
# end

# post "/contacts" do
#      # new_contact = Contact.new(params[:id],params[:first_name], params[:last_name], params[:email], params[:note])
#      #  @@rolodex.create_contact_alternate(new_contact)
#   @@rolodex.create_contact(params[:counter], params[:first_name], params[:last_name], params[:email], params[:note])
#   # contacts = Contact.new(params[:id], params[:first_name], params[:last_name], params[:email], params[:note])
#   redirect to ("/contacts")
# end

# post "/modify" do
#   @@rolodex.modify_contact(params[:id], params[:new_first_name], params[:new_last_name], params[:new_email], params[:new_note])
#   redirect to ("/contacts")
# end

get '/contacts' do  #1.  read all contacts
  @contacts = @@rolodex.contacts
  erb :contacts
end

post '/contacts'  do  #2.   Create a contact
  @@rolodex.create_contact(params[:counter], params[:first_name],params[:last_name], params[:email], params[:notes])
  redirect to ("/contacts")
end

get '/contacts/new' do        #7.   Return a form for a new contact
  erb :add_contact
end

get '/contacts/:id' do #3.   Read one contact with that id
  @@rolodex.find(params[:id])
  erb :show_contacts
end

put '/contacts/:id' do  #4.   Update the existing contact with that id
  @@rolodex.modify_contact(params[:id], params[:new_first_name], params[:new_last_name], params[:new_email], params[:new_note])
  redirect to :contacts
end

delete '/contacts/:id' do  #5.   Delete the existing contact with that id
  @contacts = @@rolodex.delete_contact(params[:id])
  redirect to :contacts
end

get '/contacts/:id/edit' do  #6.   Return a form for updating an existing contact
  @contact = @@rolodex.find(params[:id])
  erb :modify
end


