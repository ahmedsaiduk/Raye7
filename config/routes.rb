# frozen_string_literal: true

Rails.application.routes.draw do
  resources :trips
  resources :places
  resources :pickups
  devise_for :users
  root 'dash_board#index'
end
