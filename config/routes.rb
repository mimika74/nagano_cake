Rails.application.routes.draw do


  devise_for :customers
  root to: 'public/homes#top'
  get "/home/about" => "homes#about"


devise_scope :admin do

  namespace :admin do
  get 'orders/:id' => 'orders#show', as: :admin_orders_show
  end

  namespace :admin do
    get 'customers' => 'customers#index', as: :admin_customers_index
    get 'customers/:id' => 'customers#show', as: :admin_customers_show
    get 'customers/:id/edit' => 'customers#edit', as: :admin_customers_edit
  end
  namespace :admin do
    get 'genres' => 'genres#index', as: :admin_genres_index
    get 'jenres/:id/edit' => 'genres#edit', as: :admin_jenres_edit
  end
  namespace :admin do
    get 'items' => 'items#index', as: :admin_items_index
    get 'items/new'
    get 'items/:id' => 'items#show', as: :admin_items_show
    get 'items/:id/edit' => 'items#edit', as: :admin_items_edit
  end
  namespace :admin do
    get '/' => 'homes#top', as: :admin_homes_top
  end
  namespace :admin do
    get 'sign_in' =>'sessions#new', as: :admin_sessions_new
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end




  namespace :public do
    resources :items, only:[:show, :index]
  end

  get "customers/sign_in" => "public/sessions#new"
  post "/customers/sign_in" => "public/sessions#create"
  delete "/customers/sign_out" => "public/sessions#destroy"

end
