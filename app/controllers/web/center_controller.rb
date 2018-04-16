class Web::CenterController < Web::BaseController
	layout "center"
	def index
			@industrye = Industrye.all()
	end

end