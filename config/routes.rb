Rails.application.routes.draw do

  # devise_scope :user do
  #   get "register" => "devise/registrations#new", as: "new_user_registration"
  # end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    # omniauth_callbacks: 'omni_auth',
  },
  path: '', path_names: { sign_out: 'signed-out' }

  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_up', to: 'users/registrations#new'
    get 'forgot_password', to: 'users/passwords#new'
    get 'reset_password', to: 'users/passwords#edit'
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :activities
  resources :users
  
  root to: 'pages#home'
  get 'signed-out', to: 'signouts#index'
  
end
