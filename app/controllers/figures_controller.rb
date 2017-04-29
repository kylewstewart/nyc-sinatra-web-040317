
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
    params[:figure][:landmark_ids] << Landmark.create(params[:landmark]).id unless params[:landmark][:name] == ""
    params[:figure][:title_ids] << Title.create(params[:title]).id unless params[:title][:name] == ""
    figure = Figure.create
    figure.update(params[:figure])
    redirect to ('/figures')
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.where(figure_id: params[:id])
    figure_titles = FigureTitle.where(figure_id: params[:id])
    @titles = figure_titles.collect {|figure_title| Title.find(figure_title.title_id)}
    erb :'/figures/show.html'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.order(:name)
    @figure_titles = FigureTitle.where(figure_id: params[:id])
    @titles = Title.order(:name)
    erb :'/figures/edit.html'
  end

  delete '/figures/:id' do      #DESTROY
    Figure.find(params[:id]).destroy
    redirect to ('/figures')
  end

end
