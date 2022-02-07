Rails.application.routes.draw do
  resources :jobs do
    resources :applications
  end
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  post 'makeAdmin', to: 'admin#create'
  get 'job/desc', to: 'desc#index'
end
