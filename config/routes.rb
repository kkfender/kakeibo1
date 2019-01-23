Rails.application.routes.draw do

root 'home#top'
get "/about" => "home#about"
resources:users
   get  "inputs/index" => "inputs#index"
resources:inputs
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "signup"=> "users#new"                   ##ユーザー登録ページ
  get  "login"=> "users#login_form"

end
