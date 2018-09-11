class Admin::AddressesController < Admin::BaseController

before_action :set_address, only: [:show, :edit, :update, :destroy]
	def index
		if params[:id]
			@address = Address.where(:id)
		elsif
			@address = Address.all
		end
	end

	def new
		@address = Address.new
		
	end

	def create
		@address = Address.new(address_params)
		@address.save
	end

	def update
		@address.update(address_params)
	end

	def show
	end

	def destroy
      @address.destroy
  
    end

	def set_address
		@address = Address.find(params[:id])
    end


	def address_params
		params.require(:address).permit(:id, :province, :city, :county, :town, :street, :door_number)
	end

end