class LandmarksController < ApplicationController

  get '/landmarks' do
    # "Hi! I'm in Landmarks"
    @landmarks = Landmark.all
    erb :"/landmarks/index"
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.new(params[:landmark])
      if !params["landmark"]["figure"].empty?
        @landmark.figure << Figure.create(name: params["figure"]["name"])
      end
      @landmark.save

    redirect "/landmarks/#{@landmark.id}"
  end
end
