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

  get '/contacts/add_contact' do
    erb :add_contact
  end

  get '/contacts/:id/delete' do
    @contact = Contact.find_by(id: params[:id].to_i)
    if @contact
      erb :delete
    else
      raise Sinatra::NotFound
    end
  end

  post '/contacts' do
    Contact.create(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note]
    )
    redirect to('/contacts')
  end

  get '/contacts/:id/edit' do
    @contact = Contact.find_by(id: params[:id].to_i)
    if @contact
      erb :edit_contact
    else
      raise Sinatra::NotFound
    end
  end

  delete '/contacts/:id' do
  @contact = Contact.find_by(id: params[:id].to_i)
  if @contact
    @contact.delete
    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end

  get '/contacts/:id' do
  # params[:id]
  # 1. retrieve the recipe from the database
  #class method on recipe number, find that recipe numeber
  #then render the recipe page
    @contact = Contact.find_by(id: params[:id].to_i)
      if @contact
        erb :show_contact
      elsif
        raise Sinatra::NotFound
    end
  end
  # 2. render a recipe page
  #params is the way to access information given to u
  #thru the url; to access the info in the url:
  #localhost2342/recipes/2 <--- that 2
    # erb:recipe
#   get '/contacts/:id' do
#end



put '/contacts/:id' do
  @contact = Contact.find_by(id: params[:id].to_i)
  if @contact
    @contact.update(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note]
    )

    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end

after do
    ActiveRecord::Base.connection.close
end
