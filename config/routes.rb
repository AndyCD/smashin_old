Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'main#home'

  get 'action', to: 'main#action'
  get 'another_action', to: 'main#another_action'
  get 'another_another_action', to: 'main#another_another_action'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
