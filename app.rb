require 'sinatra/base'
require './lib/player'
require './lib/game'

  class Battle < Sinatra::Base

  enable :sessions
  set :session_secret, "key"

    get '/' do
      erb(:index)
    end

    post '/names' do
      $game = Game.new(Player.new(params[:player1]), Player.new(params[:player2]))
      redirect "/play"
    end

    get '/play' do
      @game = $game
      erb(:play)
    end

    post '/play' do
      @game = $game
      @game.attack(@game.player2)
      @hit = "You've attacked #{@game.player2.name}"
      erb(:play)
    end

  end
