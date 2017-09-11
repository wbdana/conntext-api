Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'

  namespace :api do
    namespace :v1 do
      resources :users
      resources :records
      resources :records_users, except: :destroy
      resources :messages

      get 'cu' => 'users#cu'

      get '/users/:id/created_records' => 'users#created_records'

      get '/users/:id/partner_records' => 'users#partner_records'

      post '/records_users' => '#records_users#create'

      delete '/records_users' => 'records_users#destroy'

      mount ActionCable.server, at: '/cable'
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
