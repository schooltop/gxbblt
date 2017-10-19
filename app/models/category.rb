class Category < ApplicationRecord
	has_many :blogs
	has_many :pictures
end
