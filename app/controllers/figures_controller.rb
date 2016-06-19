require 'pry'

class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all

    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @figure.titles << Title.find_or_create_by(params[:title])
    @figure.landmarks << Landmark.find_or_create_by(params[:landmark])
    redirect "/figures/#{@figure.id}"
  end


  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    if @figure != nil
      erb :"/figures/show"
    else
      erb :'/figures/new'
    end
  end

  # post '/figures/:id' do
  #   # binding.pry
  #   @figure = Figure.create(params[:figure])
  #
  #   # @figure.update(params["figure"])
  #   if !params[:landmark][:name].empty?
  #       @figure.landmarks << Landmark.create(params[:landmark])
  #   end
  #   @figure.save
  #   # erb :"/"
  #   redirect to :"/figures/#{@figure.id}"
  # end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
      @figure = Figure.find(params[:id])
      @figure.update(params[:figure][:name])
      if !params[:landmark][:name].empty?
          @figure.landmarks << Landmark.create(params[:landmark])
      end

      if !params[:figure][:title].empty?
          @figure.titles << Title.create(params[:title])
      end
      @figure.save
      redirect to :"/figures/#{@figure.id}"
  end

end
