class ProductController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @category = Category.find(params[:category_id])
    @products = @category.product.order(created_at: :desc)

    redirect_to new_user_session_path, notice: 'You must be logged in to access this page' unless current_user
  end

  def new
    @category = Category.find(params[:category_id])
    @product = Product.new
  end

  def create
    @product = Product.new(user_id: current_user.id, **product_params)
    # @product.user_id = current_user
    # @category = Category.find(params[:category_id])
    # @category.product << @product

    if @product.save
      @category_product = CategoryProduct.create(category_id: params[:category_id], product_id: @product.id)
      redirect_to category_product_index_path(@category), notice: 'Product was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :amount)
  end
end
