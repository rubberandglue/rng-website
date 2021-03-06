Rails.application.routes.draw do
  post    '/login'  => "session#create"
  get     '/login'  => "session#new",     :as => 'login'
  delete  '/logout' => "session#destroy", :as => 'logout'

  localized do
    namespace :admin do
      get '/' => 'admin#index'
      resources :users
    end
  end
end
