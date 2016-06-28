require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/bb.rb')

get '/bb/new' do
  erb( :new)
end

post '/bb' do
  @bb = BB.new(params)
  @bb.save()
  erb( :create )
end

get '/bb' do
  @bb = BB.all()
  erb(:index)
end