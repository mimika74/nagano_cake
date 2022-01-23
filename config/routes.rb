Rails.application.routes.draw do

  get 'customers/edit' => 'public/customers#edit', as: :public_customer_edit
  get 'new/create'
  get 'new/index'
  get 'new/show'
  devise_for :customers, skip: [:passwords,], controllers: {
    registrations: "customers/registrations",
    sessions: 'customers/sessions'
  }

  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }




 # devise_for :customers
  root to: 'public/homes#top'



devise_scope :admin do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
   namespace :admin do
    get '/' => 'homes#top', as: :homes_top
    resources :items
    get 'orders/:id' => 'orders#show', as: :orders_show
    get 'customers' => 'customers#index', as: :customers_index
    get 'customers/:id' => 'customers#show', as: :customers_show
    get 'customers/:id/edit' => 'customers#edit', as: :customers_edit
    patch 'customers/:id' => 'customers#update', as: :customers_update
   # resources :genres, only:[:index, :create, :edit, :update]#index', as: :genres_index
    resources :genres, only:[:index, :create, :edit, :update]#index', as: :genres_index
  #  get 'genres/:id/edit' => 'genres#edit', as: :genres_edit

  end




    get "/about" => "public/homes#about"
    #namespace :public do
    #resources :items, only:[:index, :show]
    #end

    get 'items' => 'public/items#index'
    get 'items/:id' => 'public/items#show', as: :item
    get 'customers/my_page' => 'public/customers#show'

    patch 'customers' => 'public/customers#update'
    get 'customers/unsubscribe' => 'public/customers#unsubscribe'
    patch 'customers/withdraw' => 'public/customers#withdraw'


    #get 'cart_items' => 'public/cart_items#index'
    #post 'cart_items' => 'public/cart_items#create'
    #patch 'cart_items/:id' => 'public/cart_items#update', as: :cart_item
    #delete 'cart_items/destroy_all' => 'public/cart_items#destroy_all'
    #delete 'cart_items/:id' => 'public/cart_items#destroy', as: :cart_item


    scope module: :public do
      resources :cart_items, only: [:update, :index, :create, :destroy]
      delete 'cart_items/destroy_all' => 'cart_items#destroy_all'


    get 'orders/complete' => 'orders#complete', as: :orders_complete
      resources :orders, only: [:new, :create, :index, :show]


    post 'orders/confirm' => 'orders#confirm', as: :orders_confirm




      resources :addresses, only: [:edit, :create, :index, :update, :destroy]

    end




  #namespace :customer do
    #get 'sign_up' => 'registrations#new'
    #post '/' => 'registrations#create'
    #get 'sign_in' => 'sessions#new'
    #post 'sign_in' => 'sessions#create'
    #delete 'sign_out' => 'sessions#destroy'

  #end

end
