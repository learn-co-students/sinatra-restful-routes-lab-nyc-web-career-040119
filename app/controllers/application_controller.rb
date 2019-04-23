class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  # CREATE
  get '/recipes/new' do
    erb :"recipes/new"
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect "/recipes/#{@recipe.id}"
  end

  # READ
  get '/recipes' do
    @recipes = Recipe.all
    erb :"recipes/index"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :"recipes/show"
  end

  # UPDATE
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :"recipes/edit"
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    erb :"recipes/show"
  end

  # DELETE
  delete '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect '/recipes'
  end

end
