Rails.application.routes.draw do

  devise_for :admins
  devise_for :customers
  root to: 'public/homes#top'
  get "/home/about" => "homes#about"

  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :admin do
    get 'sessions/new'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html





  namespace :public do
    resources :items, only:[:show, :index]
  end

  get "customers/sign_in" => "public/sessions#new"
  post "/customers/sign_in" => "public/sessions#create"
  delete "/customers/sign_out" => "public/sessions#destroy"

end
