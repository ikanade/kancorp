class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

 
  def index
    @companies = Company.all
    respond_to do |format|
    	format.html
    	format.json { render json: @companies}
    end
  end

  def show
  	respond_to do |format|
  		format.html
  		format.json { render json: @company, status: 200}
  	end
  end

  def new
  	@address = Address.new
    @company = Company.new(address:@address)
  end

  def edit
  
  end


  def create
  	print company_params
    @company = Company.new(company_params)
   # @company.address = Address.new(address_params)
   if @company.save
   		redirect_to @company
   else
   		render 'new'
   end
  end


  def update
    if @company.update(company_params)
    	respond_to do |format| 
				format.html { redirect_to @company, notice:"Successfully Updated the company" }
				format.json {}
    	end
    else

    end
  end

  def destroy
   @company = Company.find(params[:id])
   if @company.destroy
   	redirect_to companies_path
   end
  end

  private
    def set_company
      @company = Company.includes(employees: :address).find(params[:id])
    end
    def company_params
    	params.require(:company).permit(:name,address_attributes:[:city,:state,:locality])
    end
    def address_params
    	params.require(:company).fetch(:address,{}).permit(:city,:state,:locality)
    end
end
