require 'bundler'
Bundler.require

require './models/BuildingModel'
require './controllers/BuildingController'

run Sinatra::Application

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'chicago'
)

map('/buildings'){run BuildingController}
