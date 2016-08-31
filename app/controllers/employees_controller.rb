class EmployeesController < ApplicationController
	before_action :set_employee_and_company_id, only: [:show,:update,:edit,:destroy]
	before_action :create_fake_employee, only: [:new]
	def index

	end

	def show
		@employee = Employee.where(company_id:params[:company_id],id:params[:id]).first
	end

	def new
		#@employee = Employee.new(company_id: params[:company_id])
		puts "Employee company_id #{@employee.company_id}"
		print @employee.inspect
		puts
	end

	def create
		@employee = Employee.new(employee_params)
		if @employee.save
			respond_to do |format|
				format.html { redirect_to company_employee_path(@company_id,@employee.id), notice:"Employee has been created" }
				format.json { render :show , status: :created, location: @employee}
			end
		else 
			render 'new'
		end
	end

	def edit

	end	

	def update
		if @employee.update(employee_params)
			redirect_to company_employee_path(@company_id,@employee.id)
		else
			render 'edit'
		end
	end
	def destroy
		if @employee.destroy
			redirect_to company_path(@company_id)
		else
			render 'show'
		end
	end

	private 
		def set_employee_and_company_id
			@employee = Employee.find(params[:id])
			@company_id = params[:company_id]
		end
		def employee_params
			params.require(:employee).permit(:name,:email,:phone,:salary,:designation,:company_id,address_attributes: [:city,:state,:locality])
		end
		def create_fake_employee
			employee = {
				name:Faker::Name.name,
				email: Faker::Internet.email,
				phone: String(Faker::Number.number(10)),
				salary: Faker::Number.number(5),
				designation: Faker::Company.profession,
				company_id: params[:company_id],
				address_attributes: create_address
			}
			@employee = Employee.new(employee)
		end
		def create_address
			address = {
				city: Faker::Address.city,
				state: Faker::Address.state,
				locality: Faker::Address.street_name
			}		
		end
end