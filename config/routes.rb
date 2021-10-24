Rails.application.routes.draw do
    resources :products
    root 'top#main'
    get 'top/main'
    resources :cart_items, only: [:new, :create, :destroy]
    resources :carts, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
