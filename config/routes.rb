Rails.application.routes.draw do
  devise_for :admins, :controllers => { :registrations => "admin/registrations" }
  namespace :panel do
    resources :products
  end

  post '/panel/products/new', to: 'panel/products#new'
  post '/panel/products/create', to: 'panel/products#create'


  # scope '/panel' do
  #   resources :products
  # end
  root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
