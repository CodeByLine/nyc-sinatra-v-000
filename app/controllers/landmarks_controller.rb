require 'pry'

class LandmarksController < ApplicationController

  get '/landmarks' do
    # "Hi! I'm in Landmarks"
    @landmarks = Landmark.all
    erb :"/landmarks/index"
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
# binding.pry
    if @landmark == nil
      erb :'/landmarks/new'
    else
      erb :"/landmarks/show"
    end
  end

  post '/landmarks' do
    # binding.pry
    # raise params.inspect
    # params.to_s  => {"landmark"=>"NY", "figure"=>"Some Politician", "year_completed"=>"2016"}

    @landmark = Landmark.find_or_create_by(params[:landmark])
    redirect "/landmarks/#{@landmark.id}"
  end
    # @landmark = Landmark.create(params[:landmark]) #(:name => params[:name], :figure_id => params[:figure_id], :year_completed => params[:year_completed])

# binding.pry
#       if !params["figure"]["name"].empty?
#         @landmark.figure << Figure.create(name: params["figure"]["name"])
#       end
#       @landmark.save


  post '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
# binding.pry
    @landmark.update(params[:landmark])
  #   if !params["figure"]["name"].empty?
  #       @landmark.figure << Figure.create(name: params["figure"]["name"])
  #   end
  # @landmark.save

    redirect "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end
end
