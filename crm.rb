require 'sinatra'
require './contacts.rb'
require './rolodex.rb'

def app_name
  "CRM"
end

@@rolodex = Rolodex.new

@@rolodex.create_contact("John","Smith","no@email.com","none")
@@rolodex.create_contact("Jenny","Johnson","yes@email.com","everything")
@@rolodex.create_contact("Andy","Smitherine","nowhatsoever@email.com","addme")

get'/' do
  erb :index  
end

get "/contacts" do
  @app_name = CRM
  erb :add_contact
end 

get "/contacts" do
  @contacts = []
  @contacts << Contacts.new("Julie", "Hache" , "julie@bitmakerlabs.com", "Instructor")
  erb :contacts
end

