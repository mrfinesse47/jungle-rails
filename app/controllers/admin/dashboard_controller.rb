class Admin::DashboardController < ApplicationController

  before_filter :authenticate

 

  def show
    @product_count = Product.count
    @category_count = Category.count
  end
end
