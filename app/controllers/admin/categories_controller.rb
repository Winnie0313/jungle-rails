class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']

  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  # def create
  #   @product = Product.new(product_params)

  #   if @product.save
  #     redirect_to [:admin, :products], notice: 'Product created!'
  #   else
  #     render :new
  #   end
  # end

  # def destroy
  #   @product = Product.find params[:id]
  #   @product.destroy
  #   redirect_to [:admin, :products], notice: 'Product deleted!'
  # end

  # private

  # def product_params
  #   params.require(:product).permit(
  #     :name,
  #     :description,
  #     :category_id,
  #     :quantity,
  #     :image,
  #     :price
  #   )
  # end

end