require_relative 'contact'
require 'sinatra'


  get '/home' do
    erb :index
  end

  get '/contacts' do

  actual_value = Contact.all

  p actual_value

  end


  Contact.create(first_name: "melina", last_name: "mehr", email: "melinamehr@msn.com", note: "wasap")
  Contact.create(first_name: "zach", last_name: "van", email: "zachvan@gmail.com", note: "wasap part 2")
  Contact.create(first_name: "dj jilly", last_name: "j", email: "djjillyj@msn.com", note: "wasap part 3")





after do
    ActiveRecord::Base.connection.close
end
