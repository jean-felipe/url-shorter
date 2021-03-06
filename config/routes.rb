Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#index', format: false

  resources :web_sites, only: [:create, :index]
  get '/:url', to: 'web_sites#show'
end
