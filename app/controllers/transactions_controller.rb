class TransactionsController < ApplicationController
  layout "main_application"
  before_action :set_transactions, only: :index
  before_action :set_customers, only: [:index, :new_choice, :customer_choice]
  before_action :set_customer, only: [:new, :show, :edit, :update, :destroy, :customer]
  before_action :set_customer_from_params, only: :create
  before_action :set_ts_number, only: :create
  before_action :set_balance_record, only: :create

  def new
    @transaction = Transaction.new
    @subjects = Subject.all.where('ancestry IS NULL')
    @institutions = Institution.all
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save && @balance_record.update(balance: balance_calc)
      flash[:notice] = "登録が完了しました"
      redirect_to new_transactions_path(@customer)
    else
      flash.now[:alert] = '登録に失敗しました。必須項目を確認してください。'
      render :new
    end
  end

  def customer
  end

  private

  def set_transactions
    @transactions = Transaction.all.order('id DESC')
  end

  def set_customers
    @customers = Customer.all.order('id DESC')
  end

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def set_customer_from_params
    @customer = Customer.find(params[:transaction][:customer_id])
  end

  def set_ts_number
    latest = Transaction.where(customer_id: @customer).order("id DESC").first
    if latest.present?
      @ts_number = latest.ts_number + 1
    else
      @ts_number = 1
    end
  end

  def set_balance_record
    @balance_record = CustomerBalance.find_by(customer_id: params[:transaction][:customer_id])
  end

  def transaction_params
    params.require(:transaction).permit(:date, :customer_id, :subject_id, :amount, :institution_id, :summary).merge(ts_number: @ts_number, user_id: 1)
  end

  def balance_calc
    subject_status = @transaction.subject.status
    amount = @transaction.amount
    if subject_status == 0
      @balance_record.balance += amount
    else
      @balance_record.balance -= amount
    end
  end
end
