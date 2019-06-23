crumb :root do
  link "トップ", root_path
end

crumb :customer_parent do
  link "利用者情報", customers_path
end

# customers#new
crumb :new_customer do
  link "利用者登録", new_customer_path
  parent :customer_parent
end

# customers#index
crumb :customers do
  link "一覧表示", customers_path
  parent :customer_parent
end

# customers#show
crumb :customer do |customer|
  link customer.name, customer_path(customer)
  parent :customers
end

# customers#edit
crumb :edit_customer do |customer|
  link customer.name, edit_customer_path(customer)
  parent :customer
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
