crumb :root do
  link "Home", root_path
end

crumb :new_item do
  link "新規投稿商品", new_item_path
  parent :root
end

# crumb :item do
#   link "商品詳細", item_path
#   parent :root
# end

crumb :edit_item do
  link "商品編集", edit_item_path
  parent :item
end


crumb :items_item_search do
  link "商品検索", items_item_search_path
  parent :root
end

crumb :user do
  link "マイページ", user_path
  parent :root
end

crumb :user_registration do
  link "新規登録１", new_user_registration_path
  parent :root
end

crumb :addresses_registration do
  link "新規登録２", addresses_path
  parent :new_user_registration
end

# crumb :edit_user_registration do
#   link "登録情報編集", edit_user_registration_path
#   parent :user
# end

# crumb :edit_addresses do
#   link "登録住所編集", edit_addresses_path
#   parent :user
# end

crumb :new_user_registration do
  link "ログイン", new_user_session_path
  parent :root
end

crumb :item_tags do
  link "タグ登録", item_tags_path
  parent :new_item
end

crumb :new_card do
  link "カード情報登録", new_card_path
  parent :root
end

# crumb :item_purchases do
#   link "購入完了", item_purchases_path
#   parent :new_item_purchase
# end

# crumb :new_item_purchase do
#   link "購入内容確認", new_item_purchase_path
#   parent :item
# end


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