require 'sinatra/base'
require './lib/player'

  class Battle < Sinatra::Base

  enable :sessions
  set :session_secret, "key"

    get '/' do
      erb(:index)
    end

    post '/names' do
      $player1 = Player.new(params[:player1])
      $player2 = Player.new(params[:player2])
      redirect "/play"
    end

    get '/play' do
      @player1 = $player1
      @player2 = $player2
      erb(:play)
    end

    post '/play' do
      @player1 = $player1
      @player2 = $player2
      @player2.deduct_hp
      session[:hit] = "You've attacked #{@player2.name}"
      @hit = session[:hit]
      erb(:play)
    end

  end
