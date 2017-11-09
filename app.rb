require 'sinatra/base'

  class Battle < Sinatra::Base

  enable :sessions
  set :session_secret, "key"

    get '/' do
      erb(:index)
    end

    post '/names' do
      session[:player1] = params[:player1]
      session[:player2] = params[:player2]
      redirect "/play"
    end

    get '/play' do
      @player1 = session[:player1]
      @player2 = session[:player2]
      erb(:play)
    end

    post '/play' do
      @player1 = session[:player1]
      @player2 = session[:player2]
      session[:hit] = "You've attacked #{@player2}"
      @hit = session[:hit]
      erb(:play)
    end

  end
