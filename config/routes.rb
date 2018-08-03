Rails.application.routes.draw do
  devise_for :users
  root 'grids#index'

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  resources :grids
  
  post '/square/:x/:y/:color', to: 'squares#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
