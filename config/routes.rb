Rails.application.routes.draw do
  resources :roles
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }, skip: [:passwords]

  root to: 'posts#index'

  resources :posts, except: [:index]
  get '/accept/:id' => 'posts#accept', as: 'accept'
  get '/export' => 'posts#export', as: 'export'
  get 'books' => 'posts#books'

  mount ActionCable.server => '/cable'
end
