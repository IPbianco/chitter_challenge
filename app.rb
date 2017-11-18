require 'sinatra/base'

require 'rubygems'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './models/user'

DataMapper.setup(:default,'postgres://localhost/chitter_test')
DataMapper.finalize
DataMapper.auto_upgrade!

class Chitter < Sinatra::Base

  get '/chitter/sign_up' do
    erb(:sign_up)
  end

  post '/chitter/sign_up' do
    name = params[:name]
    email = params[:email]
    username = params[:username]
    password = params[:password]
    @user = User.create(name: name, email: email, username: username, password: password)
    erb(:welcome)
  end

  run if app_file == $0
end
