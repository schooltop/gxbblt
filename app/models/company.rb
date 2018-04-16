class Company < ApplicationRecord
	has_many :contact
	has_many :address
	has_many :message
end