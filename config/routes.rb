Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  root 'static_pages#home'

  # match '/users/:id/finish_signup', to: 'users#finish_signup',
  #                                   via: [:get, :patch],
  #                                   as: :finish_signup
end
