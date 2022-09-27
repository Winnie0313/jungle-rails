require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "successfully save the product if inputs for all fields are provided" do
      @product = Product.new(
        name: "product 1",
        price: 1999,
        quantity: 2,
        category: Category.new(name: "Category 1")
      )
      
      @product.validate
      expect(@product.errors.full_messages).to be_empty
    end

    it "fail to save the product when name is nil" do
      @product = Product.new(
        name: nil,
        price_cents: 1999,
        quantity: 2,
        category: Category.new(name: "Category 1")
      )
      
      @product.validate
      expect(@product.errors.full_messages).to include("Name can't be blank")
     
    end 

    it "fails to save the product when price is nil" do
      @product = Product.new(
        name: "product 2",
        price_cents: nil,
        quantity: 2,
        category: Category.new(name: "Category 2")
      )
      
      @product.validate
      expect(@product.errors.full_messages).to include("Price is not a number")
     
    end 

    it "fails to save the product when quantity is nil" do
      @product = Product.new(
        name: "product 3",
        price_cents: 20000,
        quantity: nil,
        category: Category.new(name: "Category 3")
      )
      
      @product.validate
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
     
    end 

    it "fails to save the product when category is nil" do
      @product = Product.new(
        name: "product 4",
        price_cents: 20000,
        quantity: 4,
        category: nil
      )
      
      @product.validate
      expect(@product.errors.full_messages).to include("Category can't be blank")
     
    end 







    

    
  end
end
