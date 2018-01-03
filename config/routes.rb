Rails.application.routes.draw do
  #  get 'top' => "home#top"
  namespace :admin do
    resources :users
  end

  resources :posts
  resources :users
  resources :sessions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
