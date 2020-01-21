Rails.application.routes.draw do
  get 'signouts/index'
  devise_for :users, except: :create, path: '', path_names: { sign_in: 'login', sign_out: 'signed-out' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :activities
  root 'pages#home'
  get 'signed-out', to: 'signouts#index'
end
