Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  scope defaults: { format: :json } do
    devise_for :users

    namespace :v1 do
      devise_scope :user do
        resources :sessions, only: :create
        resource :registrations, only: [:create, :update]
      end

      resources :games, only: :create
    end
  end
end
