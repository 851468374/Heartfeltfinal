Rails.application.routes.draw do
  get 'sessions/new'
  get 'tasks/show'
  get 'tasks/edit'
  get 'tasks/delete'
  get 'tasks/detail'
  get 'users/show'
  get 'users/edit'

  get  '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout',to: 'sessions#destroy'
  resources :tasks
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
