Rails.application.routes.draw do
  get 'tasks/show'
  get 'tasks/edit'
  get 'tasks/delete'
  get 'tasks/detail'
  get 'users/show'
  get 'users/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
