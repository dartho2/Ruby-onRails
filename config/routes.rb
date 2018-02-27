Rails.application.routes.draw do


  resources :invoices
  devise_for :admins, :controllers => {:registrations => "admin/registrations"}
  scope :panel do
    resources :products, only: [:index, :show, :edit, :update] do
      get 'autocomplete', on: :collection
    end
    resources :categories
    resources :orders do
      get 'autocomplete', on: :collection
      get 'earning', on: :collection, only: :index
      member do
        put :status
      end
    end
    resources :curiers
    resources :magazines
  end
  # patch  '/panel/products', to: 'panel/products#update'
  # post  '/panel/products', to: 'panel/products#update'
  # post '/panel/products/new', to: 'panel/products#new'
  # post '/panel/products/create', to: 'panel/products#create'


  # scope '/panel' do
  #   resources :products
  # end
  root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
