# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users
  resources :notes, except: :new
  resources :images, only: :create
  resource :about, only: :show, controller: :about

  root to: "notes#index"
end
