class Admin::CompaniesController < Admin::BaseController
	before_action :set_company, only: [:show, :edit, :update, :destroy]
	def index
		if params[:id]
			@company = Company.where(:id)
		elsif
			@company = Company.all
		end
	end

	def new
		@company = Company.new
	end

	def create
		@company = Company.new(company_params)
		@company.save
	end

	def show
	end

	def destroy
      @company.destroy
    end

	def set_company
		@company = Company.find(params[:id])
    end

	def update
	   @company.update(company_params)
	end


	def company_params
		params.require(:company).permit(:id,:name,:artificial,:information,:address_id,:creation_date)
	end


end