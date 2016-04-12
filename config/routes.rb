Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :merchants do
        get 'find', to: 'find#show'
        get 'find_all', to: 'find#index'
      end
      resources :merchants, only: [:index, :show]
    end
  end
end
