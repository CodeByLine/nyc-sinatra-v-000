
class FiguresController < ApplicationController
"Hello fr figures!"

  get '/figures' do
    @figures = Figures.all
    redirect to '/landmarks/index'
  end

end
