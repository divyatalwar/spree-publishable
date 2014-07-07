Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :admin do
    resources :products do
      get 'publishable'
    end
  end
end
