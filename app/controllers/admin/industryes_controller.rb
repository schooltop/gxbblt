class Admin::IndustryesController < Admin::BaseController
	def index
		if params[:category_id]
			@industryes = Industrye.where(category_id:)
		elsif
			@industryes = Industrye.all
		end
	end



	def industrye_params
		params.require(:industrye).permit(:category_id,:industrye,:parent_id)

	end

end