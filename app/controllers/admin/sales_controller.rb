class Admin::SalesController < ApplicationController
    before_filter :authenticate
    def index
        @sales = Sale.all
    end
end
