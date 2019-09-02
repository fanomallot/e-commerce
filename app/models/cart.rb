class Cart < ApplicationRecord
  belongs_to :user
  has_many :relationcis
  has_many :items, through: :relationcis
end
