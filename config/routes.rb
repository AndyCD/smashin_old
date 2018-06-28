Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'main#home'

  get 'about', to: 'main#about'

  get 'subject', to: 'main#subject'
  get 'another_subject', to: 'main#another_subject'
  get 'another_another_subject', to: 'main#another_another_subject'

  resources :users, only: [:index, :show, :edit, :update, :destroy]

  patch 'users/:id/update', to: 'users#reactivate_user', as: 'reactivate_user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
