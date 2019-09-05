class Order < ApplicationRecord
  after_create :welcome_send
  after_create :admin_send

  def admin_send
    AdminMailer.admin_email(admins).deliver_now
  end

  def welcome_send
    UserMailer.command_email(self.id).deliver_now
  end

  belongs_to :user
  has_many :relationois
  has_many :items, through: :relationois
  after_create :welcome_send

end
