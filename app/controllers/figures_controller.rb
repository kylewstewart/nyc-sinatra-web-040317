
class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.order(:name)
    erb :'figures/index.html'
  end


  get '/figures/new' do
    @landmarks = Landmark.order(:name)
    @titles = Title.order(:name)
    erb :'figures/new.html'
  end


  post '/figures' do
    params[:figure][:landmark_ids] << Landmark.create(params[:landmark]).id if params[:landmark][:name] != ""
    params[:figure][:title_ids] << Title.create(params[:title]).id if params[:title][:name] != ""

    figure = Figure.create(params[:figure])
    redirect to ('/figures')
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show.html'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show.html'
  end



end
