Rails.application.routes.draw do
  resources :product_structures
  resources :magazines
  resources :orders
  resources :categories
  devise_for :admins, :controllers => { :registrations => "admin/registrations" }
  scope :panel do
    resources :products
    resources :categories
    resources :orders
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
