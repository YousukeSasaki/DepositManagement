class TransactionsController < ApplicationController
  layout "main_application"
  before_action :set_customers, only: [:index, :new_choice, :customer_choice]
  before_action :set_customer, only: [:new, :create, :show, :edit, :update, :destroy, :customer]

  def new
    @transaction = Transaction.new
    @subjects = Subject.all.where('ancestry IS NULL')
  end

  def customer
  end

  private

  def set_customers
    @customers = Customer.all.order('id DESC')
  end

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end
end
