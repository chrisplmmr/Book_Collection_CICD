Rails.application.routes.draw do
  
  root 'books#index'
  
  # get 'books/index'
  # get 'books/show'
  # get 'books/new'
  # get 'books/edit'
  # get 'books/delete'

  # Recourceful Routes
  # Controller names
  # Add a delete res route bc its not usually included
  
  resources :books do
    member do
      get :delete
    end
  end

end
