# require 'rack-flash'
require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'models'

after do
  ActiveRecord::Base.connection.close
end

# homepage
get "/" do
  @terms = Term.all.order(created_at: :desc).take(5)
  erb :homepage
end

# index action (what are we doing here, listing out terms)
get '/terms' do
  @terms = Term.all

  erb :terms_index
end

# new
get '/terms/new' do
  @terms = Term.all

  erb :terms_new
end

# create
post '/terms' do
  term = Term.create(params)
  redirect "/terms/#{term.id}"
end

# show
get '/terms/:id' do
  id = params["id"]

  @term = Term.find_by(id: id)

  erb :terms_show
end

get '/terms/:id/edit' do
  id = params["id"]
  @term = Term.find_by(id: id)

  erb :terms_edit
end

# update
put '/terms/:id' do
  id = params["id"]
  term = Term.find_by(id: id)
  if term
    term.update_attributes(params[:term])
    redirect "/terms/#{term.id}"
  else
    redirect "/"
  end
end

# search
post '/terms/search' do
  name = params["name"]

  term = Term.where("name like '%#{name}%'").first
  if term
    redirect "/terms/#{term.id}"
    return
  else
    redirect "/terms"
  end
end

# delete
delete '/terms/:id' do
  id = params["id"]
  term = Term.find_by(id: id)
  term.delete
  redirect "/terms"
end

# CATEGORIES
get '/categories' do
  @categories = Category.all

  erb :categories_index
end

get '/categories/new' do
  @categories = Category.all

  erb :categories_new
end

post '/categories' do
  category = Category.create(params)
  redirect "/categories/#{category.id}"
end

get '/categories/:id' do
  id = params["id"]

  @category = Category.find_by(id: id)

  erb :categories_show
end
