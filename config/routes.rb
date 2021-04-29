Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :users, only: [:create, :show, :destroy, :index]
      resources :authenticate, only: [:create]
      resources :accounts, only: [:create, :show]
      resources :balance, controller: 'daily_balance', only: [:create, :index]
      resources :summary, controller: "daily_summary",  only: [:create, :destroy]
      post "password/reset", to: 'passwords#reset'
      post "password/forget", to: 'passwords#forget'
    end
    namespace :v2 do
      resources
    end
    end
end
