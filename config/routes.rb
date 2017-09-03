Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'

  namespace :api do
    namespace :v1 do
      resources :users
      resources :records
      resources :records_users

      get 'cu' => 'users#cu'

      # get '/records/:id', to: 'records#'

      # get '/users/:id/lines', to: 'users#lines'
      # get '/users/:id/created_lines', to: 'users#created_lines'
      # get '/lines/:id/users', to: 'lines#users'
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
