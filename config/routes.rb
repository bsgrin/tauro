Tauro::Application.routes.draw do
  resources :galleries
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  match '/contacts', :to => 'pages#contacts'
  root :to => 'pages#home'
end
