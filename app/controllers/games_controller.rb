class GamesController < ApplicationController
  def new
    @letters = (0...10).map { ('a'..'z').to_a[rand(26)] }
  end

  def score
    @letterArray = params[:letters]
    binding.pry
  end
end
