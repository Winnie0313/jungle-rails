class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 5 }
  validates :password_confirmation, presence: true, length: { minimum: 5 }
  # check if passwork and password_confirmation are the same
  validates :password, confirmation: true

  def self.authenticate_with_credentials(email_address, password)
    email = email_address.downcase.strip
    user = User.find_by(email: email)
    if user && user.authenticate(password)
      user
    else 
      nil
    end 
  end 


end
