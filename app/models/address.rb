class Address < ActiveRecord::Base
  belongs_to :resource, polymorphic: true

  def self.in_city city="Pune"
		Address.where(city:city,resource_type:"Employee").includes(:resource).map(&:resource)
	end
end
