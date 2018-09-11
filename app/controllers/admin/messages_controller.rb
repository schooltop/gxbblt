class Admin::MessagesController < Admin::BaseController
	before_action :set_message, only: [:show, :edit, :update, :destroy]

	def index
		@message = Message.all
	end

	def new
		@message = Message.new
	end

	def create
		@message = Message.new(message_params)
		@message.save
	end

	def set_message
		@message = Message.find(params[:id])
    end

    def update
    	@message.update(message_params)

    end

	def message_params
		params.require(:message).permit(:id, :title, :company_id, :industryes_id, :information, :contacts_id, :click_times)
	end

end
