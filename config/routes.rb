# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => "/api-docs"
  mount Rswag::Api::Engine => "/api-docs"

  resources :users, except: [:index, :show] do
    post :login
    get :notifications
  end

  post "shop/offer"
  post "credit/transfer"
end
