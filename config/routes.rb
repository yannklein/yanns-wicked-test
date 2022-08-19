Rails.application.routes.draw do
  devise_for :users
  root to: "stories#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :stories, only: [:update, :show, :index, :create] do
    resources :build, controller: 'stories/build'
  end
end
