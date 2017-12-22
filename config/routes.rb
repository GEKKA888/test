Rails.application.routes.draw do
  get '/' => "posts#index"
  get 'posts/new' => "posts#new"
  get 'posts/:id' => "posts#show"
  post 'posts/create' => "posts#create"
  get 'posts/:id/edit' => "posts#edit"
  post 'posts/:id/update' => "posts#update"
  post 'posts/:id/destroy' => "posts#destroy"

  get 'top' => "home#top"

  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "login" => "users#login_form"
  get "users/index" => "users#index"
  get "signup" => "users#new"
  get "users/:id" => "users#show"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
