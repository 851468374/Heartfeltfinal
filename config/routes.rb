Rails.application.routes.draw do
  root 'users#home'
  get 'sessions/new'
  get 'tasks/show'
  get 'tasks/delete'
  get 'tasks/detail'
  get 'users/show'
  get 'tasks/edit'
  get 'users/edit'
  get  '/login', to: 'sessions#new'
  get 'tasks/edit'

  post  '/apply', to: 'tasks#apply'
  post '/edit' , to: 'tasks#submit'
  post '/login', to: 'sessions#create'
  delete '/logout',to: 'sessions#destroy'


  resources :tasks
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
