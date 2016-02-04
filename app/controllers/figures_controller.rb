require 'pry'
class FiguresController < Sinatra::Base
  set :views, 'app/views/figures'

  get '/figures' do
    @figures = Figure.all
    erb :index
  end


  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :new
  end

  post '/figures' do
    @figure = Figure.find_or_create_by(name: params[:figure][:name])
    @figure.title_ids = params[:figure][:title_ids]
    @figure.landmark_ids = params[:figure][:landmark_ids]
    @figure.titles << Title.find_or_create_by(name: params[:title][:name])
    @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
    @figure.save

    redirect "figures/#{@figure.id}"

  end

  get '/figures/:id' do
    @figure = Figure.find_by(params[:id])
    erb :show
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(id: params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    #binding.pry
    erb :edit
  end

  patch '/figures/:id' do
    @figure = Figure.find_by(params[:id])
    @figure.update(name: params[:figure][:name])
    @figure.title_ids = params[:figure][:title_ids]
    @figure.landmark_ids = params[:figure][:landmark_ids]
    @figure.titles << Title.find_or_create_by(name: params[:title][:name])
    @figure.landmarks << Landmark.find_or_create_by!(name: params[:landmark][:name])
    @figure.save

    erb :show

  end


end
