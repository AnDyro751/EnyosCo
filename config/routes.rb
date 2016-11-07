Rails.application.routes.draw do
  resources :posts
  devise_for :members

  authenticated :member do
    root "main#home"
  end

  unauthenticated :member do
    root "main#unregistered"
  end
  get 'main/helper'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
