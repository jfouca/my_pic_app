Rails.application.routes.draw do
  get 'castor' => 'pages#index'
end

Rails.application.routes.draw do
  resources :my_pic
end
