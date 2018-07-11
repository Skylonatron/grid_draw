Rails.application.routes.draw do
  root 'grids#index'
  resources :grids

  post '/square/:x/:y/:color', to: 'squares#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
