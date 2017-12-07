Rails.application.routes.draw do
  get '/' => "posts#index"
  get 'posts/new' => "posts#new"
  get 'posts/:id' => "posts#show"
  post 'posts/create' => "posts#create"

  get 'top' => "home#top"
  get 'detail' => "home#detail"
  get 'edit' => "home#edit"
  get 'create' => "home#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
