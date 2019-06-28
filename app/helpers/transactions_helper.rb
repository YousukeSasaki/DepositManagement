module TransactionsHelper
  def c_id_change(transaction)
    "#{transaction.customer_id}-#{transaction.ts_number}"
  end
end
