Rails.application.routes.draw do
  root 'api/v1/messages#index'

  namespace :api do
    namespace :v1 do
      resources :messages, only: %i[index show create]
    end
  end
end
