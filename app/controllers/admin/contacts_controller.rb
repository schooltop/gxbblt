class Admin::ContactsController < Admin::BaseController
	before_action :set_contact, only: [:show, :edit, :update, :destroy]

	def index
		@contact = Contact.all
	end

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)
		@contact.save
	end

	def update
		@contact.update(contact_params)
	end

	def set_contact
		@contact = Contact.find(params[:id])
    end

	def contact_params
		params.require(:contact).permit(:id, :companys_id, :name, :position, :telephone, :e_mail)

	end

end