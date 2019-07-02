class UsersController < ApplicationController
  layout "main_application"

  def index
    @transactions = Transaction.all.order("id DESC").limit(3)
    @customers = Customer.all.order("id DESC").limit(3)
    @institutions = Institution.all.order("id DESC").limit(3)
  end
end
