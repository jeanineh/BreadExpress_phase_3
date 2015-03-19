BreadExpress::Application.routes.draw do
  
  get "customers/show"
  get "customers/edit"
  get "customers/index"
  get "customers/new"
  # Semi-static page routes
  # get 'home', to: 'home#index', as: :home
  # get 'home/about', to: 'home#about', as: :about
  # get 'home/contact', to: 'home#contact', as: :contact
  
  # Resource routes (maps HTTP verbs to controller actions automatically):
  resources :customers
  
end
