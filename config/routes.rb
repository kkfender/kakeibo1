Rails.application.routes.draw do

root 'home#top'
get "/about" => "home#about"
resources:users

get '/login',to:'users#new'
post '/login',to:'users#create'

end
