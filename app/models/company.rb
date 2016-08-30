class Company < ActiveRecord::Base
  has_many :employees
  has_one :address , as: :resource
  validates_presence_of :name
  accepts_nested_attributes_for :address, reject_if: :all_blank
  def search args
  	args.store(:company_id,self.id)
  	Employee.search(args)
  end
end
