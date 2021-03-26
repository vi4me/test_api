Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  post :auth, to: 'authentication#create'
  get  '/auth' => 'authentication#fetch'

  resources :users
  resources :articles do
    resources :comments
  end
end
