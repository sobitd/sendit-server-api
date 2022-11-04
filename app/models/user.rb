class User < ApplicationRecord
  has_secure_password
  has_many :parcels
  validates :first_name, :last_name, :email_address, :phone_number, :username, :password_digest, presence: true

  enum isAdmin: %i[normal admin]

  # after_initialize do
  #   self.isAdmin ||= :normal if new_record?
  # end

  # def admin?
  #   User.isAdmin = 'admin'
  # end
end
