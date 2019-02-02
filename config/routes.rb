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
  patch "users/:id/profile" => "users#profile"
  get "users/:id/profile_new" => "users#profile_new"
  get "users/:id" => "users#show"
resources:users
end
