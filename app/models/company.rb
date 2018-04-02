class Company < ActiveRecord::Base
  has_many :employees
  has_one :address , as: :resource
  validates_presence_of :name
  accepts_nested_attributes_for :address, reject_if: :all_blank
  
  def search args
		self.employees.joins(:address).where(args).pluck(:name,:email,:city,:state,:locality).flatten
  end
end
