Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  post '/users', to: 'users#register'
  post '/users/login', to: 'users#login'
  get '/users/login/check', to: 'users#check_login_status' 
  delete '/users/logout', to: 'users#check_login_status'

  # todos
  post '/todos', to: 'todos#create'
  put '/todos/:id', to: 'todos#update'
  delete '/todos/:id', to: 'todos#destroy'
  get '/todos', to: 'todos#view'
end