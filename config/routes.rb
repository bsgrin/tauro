Tauro::Application.routes.draw do
  resources :galleries do
    member do
      get 'show'
    end
  end

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  match '/info', :to => 'pages#info'
  root :to => 'pages#home'
end
