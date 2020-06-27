Rails.application.routes.draw do
  resources :portfolios

  #get 'pages/home' <--- old way -- see new way root to:
  #get 'pages/about'<-- old URL way
  #get 'pages/contact' same as above

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
end
