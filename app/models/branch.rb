class Branch < ActiveRecord::Base
  belongs_to :company
  has_one :address, as: :resource
end
