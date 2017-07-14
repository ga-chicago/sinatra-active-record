require './app.rb'

run Sinatra::Application

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'chicago'
)
