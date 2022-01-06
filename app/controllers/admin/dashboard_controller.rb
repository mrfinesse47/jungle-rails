class Admin::DashboardController < ApplicationController

  before_filter :authenticate

  def authenticate
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      username == ENV['USERNAME'] && password == ENV['PASSWORD']
    end
  end

  def show
   
  end

end
