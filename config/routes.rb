# frozen_string_literal: true

Rails.application.routes.draw do
  root 'dash_board#index'
  resources :trips
  resources :places
  resources :pickups
  devise_for :users
end
