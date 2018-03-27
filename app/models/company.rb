class Company < ApplicationRecord
	has_many :contact
	has_many :addres
	has_many :information
end