Rails.application.routes.draw do
  devise_for :users
  require 'sidekiq/web'

  mount Sidekiq::Web => '/sidekiq'
  mount ActionCable.server => '/cable'

  root to: "home#index"
end
