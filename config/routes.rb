# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'places#index'
  resources :places
  resources :events, only: [:index]
  namespace :integrations do
    get :moves, to: 'integrations#moves'
    post :moves_import, to: 'integrations#moves_import'
  end
  namespace :api do
    resources :events, only: [:index]
    resources :places, only: %i[create index destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
