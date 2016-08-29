# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
CITIES = %w(Pune Mumbai Aurangabad Nashik Nagpur Bangalore Delhi)
def create_company 
	railscorp = Company.create(name:"RailsCorp")
	railscorp.address = Address.create(city:"Pune",state:"Maharashtra",locality:"Balevadi")
	#railscorp.save
	create_employees(railscorp)
end

def create_employees company
	begin
		20.times do |iterator|
			name = Faker::Name.name
			email = Faker::Internet.email
			phone = String(Faker::Number.number(10))
			salary = Faker::Number.number(5)
			designation = Faker::Company.profession
			city = CITIES[rand(6)]
			state = Faker::Address.state
			locality  = Faker::Address.street_name
			employee = Employee.create(name:name,email:email,phone:phone,salary:salary,designation:designation)
			employee_address = Address.create(city: city, state: state, locality: locality)
			employee.address = employee_address
			company.employees << employee
			end
	rescue Exception => e
		puts e 
		puts e.message
	end
end
create_company