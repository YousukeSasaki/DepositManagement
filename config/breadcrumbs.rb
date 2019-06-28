crumb :root do
  link "トップ", root_path
end

crumb :transaction_parent do
  link "取引情報", transactions_path
end

# transactions#index
crumb :transactions do
  link "一覧表示", transactions_path
  parent :transaction_parent
end

# transactions#new_choice
crumb :new_choice_transactions do
  link "登録利用者選択", new_choice_transactions_path
  parent :transaction_parent
end

# transactions#new
crumb :new_transactions do |customer|
  link "取引登録（#{customer.name}）", new_transactions_path(customer)
  parent :new_choice_transactions
end

# transactions#customer_choice
crumb :customer_choice_transactions do
  link "閲覧利用者選択", customer_choice_transactions_path
  parent :transaction_parent
end

# transactions#customer
crumb :customer_transactions do |customer|
  link "取引一覧（#{customer.name}）", customer_transactions_path(customer)
  parent :customer_choice_transactions
end

# transactions#show
crumb :transaction do |transaction|
  link "取引詳細", transaction_path(transaction)
  parent :customer_transactions, transaction.customer
end

# transactions#edit
crumb :edit_transactions do |transaction|
  link "編集"
  parent transaction
end



crumb :customer_parent do
  link "利用者情報", customers_path
end

# customers#index
crumb :customers do
  link "一覧表示", customers_path
  parent :customer_parent
end

# customers#new
crumb :new_customer do
  link "新規登録", new_customer_path
  parent :customer_parent
end

# customers#show
crumb :customer do |customer|
  link "利用者詳細（#{customer.name}）", customer_path(customer)
  parent :customers
end

# customers#edit
crumb :edit_customer do |customer|
  link "編集（#{customer.name}）", edit_customer_path(customer)
  parent customer
end



crumb :institution_parent do
  link "施設情報", institutions_path
end

# institutions#index
crumb :institutions do
  link "一覧表示", institutions_path
  parent :institution_parent
end

# institutions#new
crumb :new_institution do
  link "新規登録", new_institution_path
  parent :institution_parent
end

# institutions#show
crumb :institution do |institution|
  link "施設詳細（#{institution.name}）", institution_path(institution)
  parent :institutions
end

# institutions#edit
crumb :edit_institution do |institution|
  link "編集（#{institution.name}）", edit_institution_path(institution)
  parent institution
end
