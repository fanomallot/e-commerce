class Item < ApplicationRecord
	has_many :relationcis
	has_many :relationois
	has_many :carts, through: :relationcis
	has_many :order,through: :relationois

	has_one_attached :avatar
end
