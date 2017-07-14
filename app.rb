require 'bundler'
Bundler.require

require "./models/BuildingModel"


get '/buildings' do
  buildings = Building.all
  buildings.to_json
end

get '/buildings/:id' do
  id = params[:id]
  building = Building.find(id)
  building.to_json
end

post '/buildings' do
  request_body = JSON.parse(request.body.read)
  building = Building.new(request_body)
  building.save
  building.to_json
end

patch '/buildings/:id' do
  id = params[:id]
  building = Building.find(id)
  request_body = JSON.parse(request.body.read)
  building.update_attributes(request_body)
  building.save
  building.to_json
end

delete '/buildings/:id' do
  id = params[:id]
  building = Building.find(id)
  building.destroy
  buildings = Building.all
  buildings.to_json
end
