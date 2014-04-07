require 'sinatra'
require './contacts.rb'
require './rolodex.rb'
# require 'data_mapper'

# DataMapper.setup(:default, "sqlite3:database.sqlite3")


def app_name
  @app_name = "CRM"
end

@@rolodex = Rolodex.new

# @@rolodex.create_contact("John","Smith","no@email.com","none")
# @@rolodex.create_contact("Jenny","Johnson","yes@email.com","everything")
# @@rolodex.create_contact("Andy","Smitherine","nowhatsoever@email.com","addme")

get "/" do
  erb :index  
end

get "/edit" do
  @@rolodex.show_contacts

end

get "/new" do
  erb :add_contact
end

get "/contacts" do
  @contacts = @@rolodex.contacts
  erb :contacts
end

get "/modify" do
  @contacts = @@rolodex.show_contacts
  erb :modify
end

post "/new" do
  erb :add_contact
end 

post "/edit" do
end

post "/contacts" do
     # new_contact = Contact.new(params[:id],params[:first_name], params[:last_name], params[:email], params[:note])
     #  @@rolodex.create_contact_alternate(new_contact)
  @@rolodex.create_contact(params[:counter], params[:first_name], params[:last_name], params[:email], params[:note])
  # contacts = Contact.new(params[:id], params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to ("/contacts")
end

post "/modify" do
  @@rolodex.modify_contact(params[:id], params[:new_first_name], params[:new_last_name], params[:new_email], params[:new_note])
  redirect to ("/contacts")

end