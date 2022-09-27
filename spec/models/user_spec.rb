require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "successfully creates user if all the fields are precent and valid" do 
      @user = User.new(
        first_name: "Winnie",
        last_name: "Li",
        email: "abc@gmail.com",
        password: "123456",
        password_confirmation: "123456"
      )
      @user.validate
      expect(@user.errors.full_messages).to be_empty
    end 

    it "failed to create user when email is blank" do 
      @user = User.new(
        first_name: "Winnie",
        last_name: "Li",
        email: nil,
        password: "123456",
        password_confirmation: "123456"
      )
      @user.validate
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end 

    it "failed to create user when first name is blank" do 
      @user = User.new(
        first_name: nil,
        last_name: "Li",
        email: "abc@gmail.com",
        password: "123456",
        password_confirmation: "123456"
      )
      @user.validate
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end 

    it "failed to create user when last name is blank" do 
      @user = User.new(
        first_name: "Winnie",
        last_name: nil,
        email: "abc@gmail.com",
        password: "123456",
        password_confirmation: "123456"
      )
      @user.validate
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end 

    it "failed to create user when password is blank" do 
      @user = User.new(
        first_name: "Winnie",
        last_name: "Li",
        email: "abc@gmail.com",
        password: nil,
        password_confirmation: "123456"
      )
      @user.validate
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end 

    it "failed to create user when password confirmation is blank" do 
      @user = User.new(
        first_name: "Winnie",
        last_name: "Li",
        email: "abc@gmail.com",
        password: "123456",
        password_confirmation: nil
      )
      @user.validate
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end 

    it "failed to create user when password and password confirmation don't match" do 
      @user = User.new(
        first_name: "Winnie",
        last_name: "Li",
        email: "abc@gmail.com",
        password: "123456",
        password_confirmation: "abcdefg"
      )
      @user.validate
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end 

    it "failed to create user when password length is less than the minimum length" do 
      @user = User.new(
        first_name: "Winnie",
        last_name: "Li",
        email: "abc@gmail.com",
        password: "1234",
        password_confirmation: "1234"
      )
      @user.validate
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end 

    it "failed to create user when email is not unique" do 
      @user_1 = User.new(
        first_name: "Winnie",
        last_name: "Li",
        email: "abc@gmail.com",
        password: "123456",
        password_confirmation: "123456"
      )

      @user_1.save

      @user_2 = User.new(
        first_name: "Jimmy",
        last_name: "Lin",
        email: "abc@gmail.com",
        password: "abcdefg",
        password_confirmation: "abcdefg"
      )

      @user_2.validate
      expect(@user_2.errors.full_messages).to include("Email has already been taken")
    end 

  end


  
  describe '.authenticate_with_credentials' do
    before(:each) do
      @user = User.new(
        first_name: "Winnie",
        last_name: "Li",
        email: "abc@gmail.com",
        password: "123456",
        password_confirmation: "123456"
      )

      @user.save
    end 

    it "successfully login when successfully authenticated" do
      user1 = User.authenticate_with_credentials("abc@gmail.com", "123456")
      expect(user1).to be_truthy
    end

    it "successfully login if a visitor types in the wrong case for email" do
      user1 = User.authenticate_with_credentials("ABC@GMAIL.COM", "123456")
      expect(user1).to be_truthy
    end

    it "successfully login if a visitor types in a few spaces before and/or after their email address" do
      user1 = User.authenticate_with_credentials("   abc@gmail.com", "123456")
      expect(user1).to be_truthy
    end

    it "returns nil when entered wrong password" do 
      expect(User.authenticate_with_credentials("abc@gmail.com", "wrong password")).to be_nil
    end 

    it "returns nil when entered wrong email" do 
      expect(User.authenticate_with_credentials("wrong email", "123456")).to be_nil
    end 





    
  end
end
