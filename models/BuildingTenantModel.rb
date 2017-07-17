class BuildingTenant < ActiveRecord::Base
  self.table_name = 'building_tenants'
  belongs_to :tenant
  belongs_to :building
end
