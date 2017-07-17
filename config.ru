require 'bundler'
Bundler.require

require './models/BuildingTenantModel'
require './models/BuildingModel'
require './models/TenantModel'
require './models/UserModel'

require './controllers/BuildingController'
require './controllers/TenantController'
require './controllers/UserController'

run Sinatra::Application

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'chicago'
)

map('/buildings'){run BuildingController}
map('/tenants'){run TenantController}
map('/users'){run UserController}
