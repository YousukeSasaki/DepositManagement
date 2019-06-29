class TransactionsController < ApplicationController
  layout "main_application"
  before_action :set_transactions, only: :index
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  before_action :set_customers, only: [:index, :new_choice, :customer_choice]
  before_action :set_customer, only: [:new, :customer]
  before_action :set_customer_from_params, only: :create
  before_action :set_customer_from_transaction, only: [:show, :edit, :update, :destroy]
  before_action :set_subjects, only: [:new, :create, :edit, :update]
  before_action :set_institutions, only: [:new, :create, :edit, :update]
  before_action :set_ts_number, only: :create
  before_action :set_balance_record, only: [:create, :update]

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(create_transaction_params)
    if @transaction.save && @balance_record.update(balance: balance_calc_new)
      flash[:notice] = "登録が完了しました"
      redirect_to new_transactions_path(@customer)
    else
      flash.now[:alert] = '登録に失敗しました。必須項目を確認してください。'
      render :new
    end
  end

  def update
    @old_subject_status = @transaction.subject.status
    @old_amount = @transaction.amount
    @customer = @transaction.customer
    if @transaction.update(update_transaction_params)
      @balance_record.update(balance: balance_calc_update)
      flash[:notice] = "正常に変更されました"
      redirect_to customer_transactions_path(@customer)
    else
      flash.now[:alert] = '変更に失敗しました  必須項目を確認してください'
      render :edit
    end
  end

  def destroy
    @customer = @transaction.customer
    @balance_record = Balance.find_by(customer_id: @customer.id)
    if @transaction.destroy
      @balance_record.update(balance: balance_calc_destroy)
      flash[:alert] = '取引を削除しました'
      redirect_to customer_transactions_path(@customer)
    else
      flash[:alert] = '取引削除に失敗しました'
      render :edit
    end
  end

  def customer
    @transactions = Transaction.where(customer_id: @customer.id).order('id DESC')
  end

  private

  def set_transactions
    @transactions = Transaction.all.order('id DESC')
  end

  def set_transaction
    @transaction = Transaction.find(params[:id])
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

  def set_customer_from_transaction
    @customer = @transaction.customer
  end

  def set_subjects
    @subjects = Subject.all.where('ancestry IS NULL')
  end

  def set_institutions
    @institutions = Institution.all
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
    @balance_record = Balance.find_by(customer_id: @customer.id)
  end

  def create_transaction_params
    params.require(:transaction).permit(:date, :customer_id, :subject_id, :amount, :institution_id, :summary).merge(ts_number: @ts_number, user_id: 1)
  end

  def update_transaction_params
    params.require(:transaction).permit(:date, :customer_id, :subject_id, :amount, :institution_id, :summary).merge(user_id: 1)
  end

  def balance_calc_new
    subject_status = @transaction.subject.status
    amount = @transaction.amount
    if subject_status == 0
      @balance_record.balance += amount
    else
      @balance_record.balance -= amount
    end
  end
  
  def balance_calc_update
    new_subject_status = @transaction.subject.status
    new_amount = @transaction.amount
    if @old_subject_status == 0 && new_subject_status == 0 
      @balance_record.balance = @balance_record.balance - @old_amount + new_amount
    elsif @old_subject_status == 0 && new_subject_status == 1
      @balance_record.balance = @balance_record.balance - @old_amount - new_amount
    elsif @old_subject_status == 1 && new_subject_status == 0
      @balance_record.balance = @balance_record.balance + @old_amount + new_amount
    else
      @balance_record.balance = @balance_record.balance + @old_amount - new_amount
    end
  end

  def balance_calc_destroy
    subject_status = @transaction.subject.status
    amount = @transaction.amount
    if subject_status == 0
      @balance_record.balance -= amount
    else
      @balance_record.balance += amount
    end
  end
end
