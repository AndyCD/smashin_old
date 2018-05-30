Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'main#home'

  get 'subject', to: 'main#subject'
  get 'another_subject', to: 'main#another_subject'
  get 'another_another_subject', to: 'main#another_another_subject'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
