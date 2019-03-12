
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipes/new' do 
    erb :new
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do 
    @recipe = Recipe.find(params[:id])
    erb :show_delete
  end
  
  get '/recipes/:id/edit' do 
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  delete '/recipes/:id' do
    @recipe = Recipe.delete(params[:id])
    redirect to('/recipes')
  end

  patch '/recipes/:id' do 
    @recipe = Recipe.find(params[:id])
    @recipe.update(params[:recipe])
    redirect to("/recipes/#{@recipe.id}")
  end

  post "/recipes/new" do 
    @recipe = Recipe.create(params[:recipe])
    redirect to("/recipes/#{@recipe.id}")
  end




  

end
