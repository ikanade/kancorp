class Company < ActiveRecord::Base
  has_many :employee
  has_one :address , as: :resource

end
