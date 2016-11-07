Rails.application.routes.draw do
  devise_for :members
  get 'main/home'

  get 'main/unregistered'

  get 'main/helper'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
