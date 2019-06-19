class CustomersController < ApplicationController
  layout "main_application"
  before_action :set_customer, only: [:show, :edit]

  def index
    @customers = Customer.all.order('id DESC')
  end

  def new
    @customer = Customer.new
  end

  def create
    customer = Customer.new(customer_params)
    if customer.save
      flash[:notice] = "登録が完了しました"
      redirect_to customers_path
    else
      flash[:alert] = '登録が失敗しました。必須項目を確認してください。'
      redirect_to new_customer_path
    end
  end

  def show

  end

  def edit
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :kana, :sex, :birthday, :phone_number, :cell_phone_number, :emergency_phone_number, :postal_code, :prefecture_id, :city, :address, :building, :start_date, :image)
  end
end
