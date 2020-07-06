Rails.application.routes.draw do
  resources :users

  #API Routes
  namespace :v1 do
    resources :users, only: %i(index show)
  end

  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
