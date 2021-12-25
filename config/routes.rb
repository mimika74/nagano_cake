Rails.application.routes.draw do


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
   # resources :genres, only:[:index, :create, :edit, :update]#index', as: :genres_index
    resources :genres, only:[:index, :create, :edit, :update]#index', as: :genres_index
  #  get 'genres/:id/edit' => 'genres#edit', as: :genres_edit

  end



  namespace :public do
    get "/about" => "homes#about"
    get 'items' => 'items#index'
    get 'items/:id' => 'items#show'
    get 'customers/my_page' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    patch 'customers' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'

  end

  #namespace :customer do
    #get 'sign_up' => 'registrations#new'
    #post '/' => 'registrations#create'
    #get 'sign_in' => 'sessions#new'
    #post 'sign_in' => 'sessions#create'
    #delete 'sign_out' => 'sessions#destroy'

  #end

end
