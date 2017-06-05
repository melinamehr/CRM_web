require_relative 'contact'
require 'sinatra'

  get '/' do
    redirect to ('/contacts')
  end

  get '/home' do
    erb :index
  end

  get '/contacts' do
    @contacts = Contact.all
    erb :contacts
  end

  get '/about_me' do

    erb :maline
  end

  get '/contacts/:id' do
  # params[:id]
  # 1. retrieve the recipe from the database
  #class method on recipe number, find that recipe numeber
  #then render the recipe page
    @contact = Contact.find_by(id: params[:id].to_i)
      if @contact
        erb :show_contact
      else
        raise Sinatra::NotFound
      end
  # 2. render a recipe page
  #params is the way to access information given to u
  #thru the url; to access the info in the url:
  #localhost2342/recipes/2 <--- that 2
    # erb:recipe
  end

#   get '/contacts/:id' do
#
# end


after do
    ActiveRecord::Base.connection.close
end
