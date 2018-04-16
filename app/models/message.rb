class Message < ApplicationRecord
	belongs_to :company
	has_many :contact
end