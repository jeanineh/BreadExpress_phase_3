BreadExpress::Application.routes.draw do
  
  # Semi-static page routes
  
  get 'home/about', to: 'home#about', as: :about
  get 'home/contact', to: 'home#contact', as: :contact
  get 'home/privacy', to: 'home#privacy', as: :privacy
  get 'home/search', to: 'home#search', as: :search
  
  
  # Resource routes (maps HTTP verbs to controller actions automatically):
  resources :customers
  
  root to: 'customers#index', as: :home
end
