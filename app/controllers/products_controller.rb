class ProductsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      flash[:success] = 'Product created!'
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @product.destroy
    flash[:success] = 'Product deleted'
    redirect_to request.referrer || root_url
  end

  private

    def product_params
      params.require(:product).permit(:product, :description, :brand, :category, :price, :picture)
    end

    def correct_user
      @product = current_user.products.find_by(id: params[:id])
      redirect_to root_url if @product.nil?
    end
end
