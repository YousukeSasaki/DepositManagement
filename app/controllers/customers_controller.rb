class CustomersController < ApplicationController
  layout "main_application"
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = Customer.all.order('id DESC').page(params[:page]).per(10)
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      flash[:notice] = "登録が完了しました"
      redirect_to customers_path
    else
      flash.now[:alert] = '登録に失敗しました。必須項目を確認してください。'
      render :new
    end
  end

  def update
    if @customer.update(customer_params)
      flash.now[:notice] = "正常に変更されました"
      render :edit
    else
      flash.now[:alert] = '変更に失敗しました。必須項目を確認してください。'
      render :edit
    end
  end

  def destroy
    if @customer.destroy
      flash[:notice] = "削除されました"
      redirect_to customers_path
    else
      flash[:alert] = '削除に失敗しました'
      redirect_to customer_path(@customer)
    end
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :kana, :sex, :birthday, :phone_number, :cell_phone_number, :emergency_phone_number, :postal_code, :prefecture_id, :city, :address, :building, :start_date, :image)
  end
end
