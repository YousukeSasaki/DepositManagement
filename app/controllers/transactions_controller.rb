class TransactionsController < ApplicationController
  layout "main_application"

  def index
  end

  def new
    @transaction = Transaction.new
  end
end
