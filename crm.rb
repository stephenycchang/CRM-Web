require 'sinatra'
require 'contacts'

get'/' do
  erb :index  
end

get "/contacts" do
  @contacts = []
  @contacts << Contacts.new("Julie", "Hache" , "julie@bitmakerlabs.com", "Instructor")

  erb :contacts
end

