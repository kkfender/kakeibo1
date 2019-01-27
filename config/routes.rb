Rails.application.routes.draw do

root 'home#top'
get "/about" => "home#about"
resources:users
   get  "outputs/index/:date" => "outputs#index"
   post "outputs/index/:date" => "outputs#index"
resources:outputs
  post "login" => "users#login"
  get "logout" => "users#logout"
  get "signup"=> "users#new"                   ##ユーザー登録ページ
  get  "login"=> "users#login_form"
resources:users
end
