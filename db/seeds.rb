# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
CITIES = %w(Pune Mumbai Aurangabad Nashik Nagpur Bangalore Delhi)
def create_company name,count
	company = Company.create(name:name)
	company.address = Address.create(city:"Pune",state:"Maharashtra",locality:"Balevadi")
	#railscorp.save
	create_employees(company,count)
	temp_employee = Employee.create(name:"Ishan Kanade",
									email:"ekanade@gmail.com",
									phone:"8600592953",
									salary:60000,
									designation:"Dev",
									company_id: company.id)
	temp_employee.address = create_address()

end

def create_employees company,count
	begin
		count.times do |iterator|
			name = Faker::Name.name
			email = Faker::Internet.email
			phone = String(Faker::Number.number(10))
			salary = Faker::Number.number(5)
			designation = Faker::Company.profession
			employee = Employee.create(name:name,email:email,phone:phone,salary:salary,designation:designation)
			employee.address = create_address()
			employee.company_id = company.id
			end
	rescue Exception => e
		puts e 
		puts e.message
	end
end
def create_address
	city = CITIES[rand(6)]
	state = Faker::Address.state
	locality  = Faker::Address.street_name
	Address.create(city: city, state: state, locality: locality)		
end
create_company("RailsCorp",20)
create_company("Oscorp",10)
