require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = (0...10).map { ('a'..'z').to_a[rand(26)] }
  end

  def score
    @letters = params[:lettersArray]
    @letters = @letters.chars

    @user_word = params[:word]
    # 1. Word can't be build from array
    if included?(@user_word, @letters)
      # 2. Word is valid according grid, but not an English word
      if english_word?(@user_word)
        # 3. Word is completely valid
        @message = 'Congratulations!'
      else
        @message = 'Sorry, not an english word'
      end
    else
      @message = 'Sorry, word not in grid'
    end
  end

  def included?(user_input, generated)
    user_input.chars.all? { |letter| user_input.count(letter) <= generated.count(letter) }
  end

  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end
end
