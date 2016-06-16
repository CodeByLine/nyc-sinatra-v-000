require 'pry'

class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do

    @figure = Figure.create(params[:figure])
      # raise params.inspect

    if !params["landmark"][:name].empty?
      @figure.landmarks << Landmark.create(name: params[:landmark][:name])
    end
    @figure.save

    redirect :'/figures/#{@figure.id}'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end


  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    if @figure != nil
      erb :"/figures/show"
    else
      erb :'/figures/new'
    end
  end

  post '/figures/:id' do
    @figure = Figure.create(params[:figure])
# binding.pry
    # @figure.update(params["figure"])
    if !params[:landmark][:name].empty?
        @figure.landmarks << landmark.create(params[:landmark])
    end
    @figure.save
    redirect to :"/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
      @figure = Figure.find(params[:id])
      @figure.update(params[:figure])
      if !params[:landmark][:name].empty?
          @figure.landmarks << landmark.create(params[:landmark])
      end
      @figure.save
      redirect to :"/figures/#{@figure.id}"
  end

end
