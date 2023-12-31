Rails.application.routes.draw do

  namespace :admins_backoffice do
    get 'welcome/index'
    resources :admins
    resources :subjects
    resources :questions
  end

  namespace :users_backoffice do
    get 'welcome/index'
    get 'profile', to: 'profile#edit'
    patch 'profile', to: 'profile#update'
  end

  namespace :site do
    get 'welcome/index'
    get 'questions/index'
    get 'search', to: 'search#questions'
    post 'answer', to: 'answer#question'
    get 'subject/:subject_id/:subject', to: 'search#subject', as: 'search_subject'
  end

  devise_for :admins, skip: [:registration]
  devise_for :users
  root 'site/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
