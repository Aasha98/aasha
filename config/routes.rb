Rails.application.routes.draw do
  root "sessions#index"
  resources :sessions
  resources :users
  delete '/logout' => "sessions#destroy", as: 'logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :salaries
  get 'formone' => 'users#formone', as: 'formone'
end
