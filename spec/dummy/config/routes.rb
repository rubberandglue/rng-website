Dummy::Application.routes.draw do
  get 'admin/' => 'admin#index', as: 'admin'
  root to: 'session#index'
end
