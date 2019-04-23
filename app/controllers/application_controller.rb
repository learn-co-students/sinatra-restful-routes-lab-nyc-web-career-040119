require "pry"
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

#index action
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

#new action
  get '/recipes/new' do
    erb :new
  end

#show action
  get '/recipes/:id' do
    @recipes = Recipe.find(params[:id])
    erb :show
  end

  post '/recipes' do
    @recipes = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "/recipes/#{@recipes.id}"
  end

#edit action
  get '/recipes/:id/edit' do
    @recipes = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipes = Recipe.find(params[:id])
    @recipes.update(name: params[:name], ingredients: params[:ingredients],cook_time: params[:cook_time])
    erb :show
  end

#delete action
  delete "/recipes/:id" do
    @recipes = Recipe.find(params[:id])
    @recipes.destroy
    redirect '/recipes'
  end

end
