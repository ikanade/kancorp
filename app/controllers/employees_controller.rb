class EmployeesController < ApplicationController
	def index

	end

	def show
		@employee = Employee.where(company_id:params[:company_id],id:params[:id]).first
	end

	def new

	end

	def create

	end

	def destroy
	
	end
	
	def update
	
	end


end