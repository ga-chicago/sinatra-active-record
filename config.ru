require 'bundler'
Bundler.require

require './models/BuildingTenantModel'
require './models/BuildingModel'
require './models/TenantModel'

require './controllers/BuildingController'
require './controllers/TenantController'

run Sinatra::Application

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'chicago'
)

map('/buildings'){run BuildingController}
map('/tenants'){run TenantController}
