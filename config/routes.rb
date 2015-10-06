Rails.application.routes.draw do

  root 'pages_controller#home'
  # get 'home/home'
  # get 'pages_controller/home'

  resources :blogs

end
