require 'pry'
class LandmarksController < Sinatra::Base
  set :views, 'app/views/landmarks'

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :index
  end

  get '/landmarks/new' do
    erb :new
  end

  post '/landmarks' do
    @landmark = Landmark.find_or_create_by(name: params[:landmark][:name])
    @landmark.year_completed = params[:landmark][:year_completed]
    @landmark.save

  #  @landmark.landmark_ids = params[:figure][:landmark_ids]
  #  @landmark.titles << Title.find_or_create_by(name: params[:title][:name])
  #  @landmark.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
  #  @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by(params[:id])
    erb :show
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by(params[:id])
    erb :edit
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by(params[:id])
    @landmark.update(name: params[:landmark][:name])
    @landmark.year_completed = params[:landmark][:year_completed]
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end

end
