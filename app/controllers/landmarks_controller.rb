
class LandmarksController < ApplicationController

  get '/landmarks' do            #INDEX
    @landmarks = Landmark.order(:name)
    erb :'landmarks/index.html'
  end

  get '/landmarks/new' do         #NEW
    @figures = Figure.order(:name)
    erb :'landmarks/new.html'
  end

  post '/landmarks' do           #CREATE
    Landmark.create(params[:landmark])
    redirect to ('/landmarks')
  end

  get '/landmarks/:id' do         #SHOW
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show.html'
  end

  get '/landmarks/:id/edit' do    #EDIT
    @landmark = Landmark.find(params[:id])
    @figures = Figure.order(:name)
    erb :'/landmarks/edit.html'
  end

  patch '/landmarks/:id' do       #UPDATE
    landmark = Landmark.find(params[:id])
    landmark.update(params[:landmark])
    redirect to ("/landmarks/#{params[:id]}")
  end

  delete '/landmarks/:id' do      #DESTROY
    landmark = Landmark.find(params[:id])
    landmark.destroy
    redirect to ('/landmarks')
  end

end
