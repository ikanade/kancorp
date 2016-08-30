class Company < ActiveRecord::Base
  has_many :employees
  has_one :address , as: :resource
  
  def search args
  	args.store(:company_id,self.id)
  	Employee.search(args)
  end
end
