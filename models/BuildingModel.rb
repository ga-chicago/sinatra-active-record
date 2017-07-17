class Building < ActiveRecord::Base
  self.table_name = 'buildings'
  has_many :buildingtenants, class_name: 'BuildingTenant'
  has_many :tenants, through: :buildingtenants
end
