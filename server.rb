require 'pg'
require 'sinatra'
require './lib/ruby_db.rb'

set :bind, '0.0.0.0'


get '/' do
  erb :index
end

get '/number_of_airlines' do
  blah = Airline.new
  @result = blah.airline_count
  erb :number_of_airlines
end