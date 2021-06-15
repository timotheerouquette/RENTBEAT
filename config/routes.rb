Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :studios do
    resources :bookings, only: [ :new, :create, :delete ]
  end
  get 'my-studios', to: 'studios#display'
  get 'my-bookings', to: 'bookings#display'
end
