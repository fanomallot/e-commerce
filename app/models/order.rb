class Order < ApplicationRecord

  after_create :welcome_send

  def welcome_send
    AdminMailer.admin_email(self).deliver_now
  end

  belongs_to :user
  has_many :relationois
  has_many :items, through: :relationois
end
