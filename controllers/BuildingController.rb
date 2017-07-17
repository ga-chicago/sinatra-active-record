class BuildingController < Sinatra::Base
  get '/' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    buildings = Building.all
    buildings.to_json
  end

  get '/:id/:token' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    id = params[:id]
    token = params[:token]
    user = User.find_by({token: token})
    if user
      building = Building.find(id)
      tenants = building.tenants
      {building: building, tenants: tenants}.to_json
    else
      "ACCESS DENIED YOU MAY NOT PASS"
    end
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
