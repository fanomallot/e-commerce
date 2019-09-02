class Item < ApplicationRecord


validates :title,
presence: true,
length: {in: 3..40} 
validates :description,
presence: true,
length: {min: 10}
validates :price,
presence: true,
numeracality: true
end
