Rails.application.routes.draw do
  namespace :api do
    post 'auth/login', to: 'auth#login'
    post 'auth/register', to: 'auth#register'

    namespace :v1 do
      resources :todos
      resources :posts, only: [:index, :create]
    end
  end
end
