ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'
require 'bcrypt'

# Chitter_challenge
class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, '79P9aEuZpNpqqD+ndQTYfaeE+aI='
  register Sinatra::Flash

  get '/sign_up' do
    @user = User.new
    erb(:sign_up)
  end

  get '/users' do
    erb(:users)
  end

  post '/sign_up' do
    @user = User.new(
      name: params[:name],
      email: params[:email],
      username: params[:username],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if @user.save
      session[:user_id] = @user.id
      redirect '/users'
    else
      flash.now[:notice] = 'Password and conf. password do not match'
      erb(:sign_up)
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run if app_file == $PROGRAM_NAME
end
