Rails.application.routes.draw do
  # Defines the root path route ("/")
  # root "articles#index"
  # * We sent the root route to the application controller
  # *in this case to the pages controller created by the 
  # *command rails generate pages controller 

  root 'pages#home'

  # ?About route with get request to the about page
  # ? static about pages action (#) in pages controller 
    get 'about', to: 'pages#about'
    
  # ?would expect a show and index action in the articles_controller
  resources :articles 
  #, only: [:show, :index, :new, :create, :edit, :update, :destroy]
end
