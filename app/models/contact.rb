class Contact < ApplicationRecord
	belongs_to :company
	has_many :message
end