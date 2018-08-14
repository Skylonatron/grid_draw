Rails.application.routes.draw do
  root 'grids#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    invitations: 'users/invitations',
    sessions: 'users/sessions'
  }

  namespace :auth do
    mount_devise_token_auth_for 'User', at: '', controllers: {
      sessions: 'devise_token_auth_override/sessions'
    }
  end

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  resources :grids

  post 'api/connect_user_to_grid',  to: 'api#connect_user_to_grid'
  post 'api/update_grid/:grid_id/:x/:y/:color', to: 'api#update_grid'
  get 'api/user_grids',  to: 'api#user_grids'

  
  # post '/square/:x/:y/:color', to: 'squares#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
