class Tenant < ActiveRecord::Base
  self.table_name = 'tenants'
  has_many :buildingtenants, class_name: 'BuildingTenant'
  has_many :buildings, through: :buildingtenants
end
