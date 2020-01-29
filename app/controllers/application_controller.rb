require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  get "/artists" do
    @artists = Artist.all
    erb :artists
  end

  get "/artists/new" do
    erb :form
  end

  get "/artists/:id" do
    @artists = Artist.find(params[:id])
    erb :show
  end


  post "/artists" do
    @artists = Artist.create(params)
    redirect to "/artists/#{ @artists.id }"
  end

end
