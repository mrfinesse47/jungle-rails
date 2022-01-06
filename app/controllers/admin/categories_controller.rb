class Admin::CategoriesController < ApplicationController
  before_filter :authenticate

  def authenticate
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      username == ENV['USERNAME'] && password == ENV['PASSWORD']
    end
  end

  def index
    @categories = Category.order(id: :asc).all
  end

  def new
  end

  def create
  end
end
