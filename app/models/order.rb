class Order < ApplicationRecord
  belongs_to :user
  has_many :relationois
  has_many :items, through: :relationois
end
