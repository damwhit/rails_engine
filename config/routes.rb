Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :merchants do
        get 'find', to: 'find#show'
        get 'find_all', to: 'find#index'
        get 'random', to: 'random#show'
      end
      resources :merchants, only: [:index, :show]

      namespace :customers do
        get 'find', to: 'find#show'
        get 'find_all', to: 'find#index'
        get 'random', to: 'random#show'
      end
      resources :customers, only: [:index, :show]

      get 'items/find', to: 'items#find'
      get 'items/find_all', to: 'items#find_all'
      get 'items/random', to: 'items#random'
      resources :items, only: [:index, :show]

      get 'invoices/find', to: 'invoices#find'
      get 'invoices/find_all', to: 'invoices#find_all'
      get 'invoices/random', to: 'invoices#random'
      resources :invoices, only: [:index, :show]
    end
  end
end
