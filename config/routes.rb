Rails.application.routes.draw do
  resources :posts
  devise_for :members , controllers:{
    omniauth_callbacks: "members/omniauth_callbacks"
  }

  authenticated :member do
    root "main#home"
  end

  unauthenticated :member do
    root "main#unregistered"
  end
  get 'main/helper'
  post "/complete_register" , to: "members/omniauth_callbacks#complete_register"
  resources :accounts , as: :member , only:[:show,:update,:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
