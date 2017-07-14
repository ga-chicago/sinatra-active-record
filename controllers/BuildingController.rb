class BuildingController < Sinatra::Base
  get '/' do
    buildings = Building.all
    buildings.to_json
  end

  get '/:id' do
    id = params[:id]
    building = Building.find(id)
    building.to_json
  end

  post '/' do
    request_body = JSON.parse(request.body.read)
    building = Building.new(request_body)
    building.save
    building.to_json
  end

  patch '/:id' do
    id = params[:id]
    building = Building.find(id)
    request_body = JSON.parse(request.body.read)
    building.update_attributes(request_body)
    building.save
    building.to_json
  end

  delete '/:id' do
    id = params[:id]
    building = Building.find(id)
    building.destroy
    buildings = Building.all
    buildings.to_json
  end
end
