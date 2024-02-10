Rails.application.routes.draw do
  get 'users/edit'
  get 'users/show'
  root to: 'homes#top'
  get "/homes/about" => "homes#about", as:"about"
  resources :books, only: [:new, :index, :show]
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
