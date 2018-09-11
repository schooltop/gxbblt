class Admin::IndustryesController < Admin::BaseController
	before_action :set_industrye, only: [:show, :edit, :update, :destroy]

	def index
		if params[:id]
			@industrye = Industrye.where(:id)
		elsif
			@industrye = Industrye.all
		end
	end

	def new
      @industrye = Industrye.new
	end


	def  create
		@industrye = Industrye.new(industrye_params)
		@industrye.save
	end

	def show
	end

	def update
		@industrye.update(industrye_params)
	end


	def destroy
      @industrye.destroy
  
    end

    def set_industrye
		@industrye = Industrye.find(params[:id])
    end

	def industrye_params
		params.require(:industrye).permit(:id,:industry,:parent_id)

	end

end