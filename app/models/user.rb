class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true, uniqueness: { case_sensitive: false }
  validates :last_price, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { is: 5 }
  validates :password_confirmation, presence: true, length: { is: 5 }
  # check if passwork and password_confirmation are the same
  validates :password, confirmation: { case_sensitive: ture }

  def authenticate_with_credentials(email_address, password)
    @user = User.find_by(email: email_address)
    if @user
      @user
    else 
      nil
    end 
  end 


end
