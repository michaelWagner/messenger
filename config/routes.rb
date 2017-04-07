Messenger::Application.routes.draw do
  root to: "pages#home"
  devise_for :users

  resources :posts do
    resources :comments
  end
end
