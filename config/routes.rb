Rails.application.routes.draw do
  get 'admin/show'
  get 'admin/delete'
  root 'sessions#new'
  get 'sessions/new'
  get 'tasks/show'
  get 'tasks/delete'
  get 'tasks/detail'
  get 'users/show'
  get 'tasks/edit'
  get 'users/edit'
  get 'sessions/register'
  get 'task_users/show'

  get 'tasks/permit'

  post '/register_submit',to: 'sessions#register_submit'
  post  '/apply', to: 'tasks#apply'
  patch '/edit' , to: 'tasks#submit'
  post '/edit' , to: 'tasks#submit'
  post '/login', to: 'sessions#create'
  post '/editinfo', to:'users#submit_edit'
  patch '/editinfo', to: 'users#submit_edit'
  delete '/logout',to: 'sessions#destroy'


  resources :tasks
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
