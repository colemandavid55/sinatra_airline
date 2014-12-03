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

get '/delayed_arrival' do
  blah = Airline.new
  @result = blah.delayed_arrival
  erb :delayed_arrival
end

get '/delayed_departure' do
  blah = Airline.new
  @result = blah.delayed_departure
  erb :delayed_departure
end

get '/arriving_late' do
  blah = Airline.new
  @result = blah.arriving_late
  erb :arriving_late
end

get '/average_late' do
  blah = Airline.new
  @result = blah.average_late
  erb :average_late
end

get '/average_airline' do
  blah = Airline.new
  @result = blah.average_airline
  erb :average_airline
end