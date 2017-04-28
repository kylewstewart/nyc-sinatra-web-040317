
class LandmarksController < ApplicationController

  get '/landmarks/' do            #INDEX
    @landmarks = Landmark.order(:name)

    erb :'landmarks/index.html'
  end

  get '/landmarks/new' do         #NEW
    @figures = Figure.order(:name)

    erb :'landmarks/new.html'
  end

  post '/landmarks/' do           #CREATE
    Landmark.create(params[:landmark])

    redirect to ('/landmarks/')
  end

  get '/landmarks/:id' do         #SHOW

  end

  get '/landmarks/:id/edit' do    #EDIT

  end

  patch '/landmarks/:id' do       #UPDATE

  end

  delete '/landmarks/:id' do      #DESTROY

  end

end
