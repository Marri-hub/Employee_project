Rails.application.routes.draw do
  resources :offices
  get 'employees/home'
  get 'employees/aboutus'
  get 'employees/contact'
  # devise_for :users
  root to: "employees#home"
  resources :employees do 
    member do
      get 'download_pdf'
    end 
  end

  
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
    resources :employees
    resources :offices
    end
    end
  
    devise_for :users, controllers: {registrations: 'users/registrations'}
    
    
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
