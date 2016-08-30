class Employee < ActiveRecord::Base
	belongs_to :company
  has_one :address , as: :resource
  accepts_nested_attributes_for :address

	scope :salary_between, -> ( lower = 0, upper = 99999999 ){ where(salary:lower..upper)}
	scope :order_salaries, -> ( limit = 99 ){ order(salary: :desc).limit(limit) }
  scope :top , -> ( limit ){ order_salaries(limit).pluck(:name,:salary,:designation) }
  
  VALID_EMAIL_REGEX = /\A[a-z][a-z0-9\.\-\_]+@[[a-z\-]|[^\.\W\_]]+[\.a-z][a-z]+\.[[a-z]|[^\.\W\_]]{2,6}\z/i
	# Regex Break down
	# \A[a-z] = makes sure first character is a albhabet 
	# [a-z0-9\.\-\_]+@  = selects all characters except space until @
	# [[-z\-]|[^\.\W\_]]+  = selects subdomain 
	# [\.a-z][a-z]+   = selects main domain
	# \.[[a-z]|[^\.\W\_]]{2,6} = selects domain extension (.com, .org, .in, .co.in, etc)
	
	validates :name, :email, :designation,:phone, presence: true
	validates :name, format: { with: /\A[a-zA-Z\s]+\z/, 
														 message: "only supports letters and spaces" } ,length: { maximum: 50 }
	validates :email, format: { with: VALID_EMAIL_REGEX }
	validates :phone, length: { minimum: 10, maximum: 15 },format: { with: /\A\d+\z/ }
	validates :email, :phone ,uniqueness: { scope: :company, case_sensitive: false } 
	validates :salary, numericality:{ only_integer: true, greater_than: 0 }
	
	before_save :call_me_maybe

	def call_me_maybe
		self.email = email.downcase
	end

	def self.search args
		Employee.joins(:address).where(args).pluck(:name,:email,:city,:state,:locality)
	end
end
