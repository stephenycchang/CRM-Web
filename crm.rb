require 'sinatra'
require './contacts.rb'
require './rolodex.rb'


def app_name
  @app_name = "CRM"
end

@@rolodex = Rolodex.new

@@rolodex.create_contact("John","Smith","no@email.com","none")
@@rolodex.create_contact("Jenny","Johnson","yes@email.com","everything")
@@rolodex.create_contact("Andy","Smitherine","nowhatsoever@email.com","addme")

get "/" do
  erb :index  
end

get "/edit" do
  "In Progress"
end

get "/new" do
  erb :add_contact
end

get "/contacts" do
  @contacts = @@rolodex.contacts
 erb :contacts
end

get "/modify" do
end

post "/new" do
  erb :add_contact
end 

post "/edit" do
end

post "/contacts" do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  @@rolodex.create_contact(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to ("/contacts")
end

post "/modify" do
end