class Admin::IndustryesController < Admin::BaseController
	def index
		if params[:category_id]
			@industryes = Industrye.where(category_id:1)
		elsif
			@industryes = Industrye.all
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

	def industrye_params
		params.require(:industrye).permit(:category_id,:industry,:parent_id)

	end

end