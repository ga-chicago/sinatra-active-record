class TenantController < Sinatra::Base
  get '/' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    Tenant.all.to_json
  end

  get '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    id = params[:id]
    tenant = Tenant.find(id)
    building = tenant.buildings
    {tenant: tenant, building: building}.to_json
  end

  post '/' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    tenant_props = JSON.parse(request.body.read)
    tenant = Tenant.new(tenant_props)
    tenant.save
    tenant.to_json
  end

  patch '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    id = params[:id]
    tenant = Tenant.find(id)
    tenant_props = JSON.parse(request.body.read)
    tenant.update_attributes(tenant_props)
    tenant.save
    tenant.to_json
  end

  delete '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    id = params[:id]
    tenant = Tenant.find(id)
    tenant.destroy
    Tenant.all.to_json
  end
end
