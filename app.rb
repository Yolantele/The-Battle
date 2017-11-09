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
      Game.game = Game.new(Player.new(params[:player1]), Player.new(params[:player2]))
      redirect "/play"
    end

    get '/play' do
      @game = Game.game
      erb(:play)
    end

    post '/play' do
      @game = Game.game
      @game.attack
      session[:hit] = "You've attacked #{@game.player_turn}"
      @hit = session[:hit]
      erb(:play)
    end

  end
