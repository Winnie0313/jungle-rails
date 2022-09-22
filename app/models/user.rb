class User < ApplicationRecord
  has_secure_password
  # validates :first_name, presence: true
  # validates :last_price, presence: true
  # validates :email, presence: true
  # validates :password_confirmation, presence: true
end
