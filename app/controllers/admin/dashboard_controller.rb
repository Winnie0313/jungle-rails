class Admin::DashboardController < ApplicationController
  def show
    @products_number = Product.count
    @categories_number = Category.count
  end
end
