class CustomersController < ApplicationController
    def index
        @cust = Customer.all
    end
end
