class BuildingController < Sinatra::Base
  get '/' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    buildings = Building.all
    buildings.to_json
  end

  get '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    id = params[:id]
    building = Building.find(id)
    tenants = building.tenants
    {building: building, tenants: tenants}.to_json
  end

  post '/' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    request_body = JSON.parse(request.body.read)
    building = Building.new(request_body)
    building.save
    building.to_json
  end

  patch '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    id = params[:id]
    building = Building.find(id)
    request_body = JSON.parse(request.body.read)
    building.update_attributes(request_body)
    building.save
    building.to_json
  end

  delete '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    id = params[:id]
    building = Building.find(id)
    building.destroy
    buildings = Building.all
    buildings.to_json
  end
end
