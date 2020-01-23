Rails.application.routes.draw do

  # devise_scope :user do
  #   get "register" => "devise/registrations#new", as: "new_user_registration"
  # end

  devise_for :users, path: '', path_names: { sign_out: 'signed-out' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :activities
  root to: 'pages#home'
  get 'signed-out', to: 'signouts#index'
  
end
