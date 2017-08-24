Rails.application.routes.draw do
  root 'gets#index'
  get 'gets/index'
  get 'gets/show'
  post 'gets/getweb'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
