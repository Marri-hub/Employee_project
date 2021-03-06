Rails.application.routes.draw do
  resources :offices
  get 'employees/home'
  get 'employees/aboutus'
  get 'employees/contact'
 get 'employees/jagadeesh'
  root to: "employees#current"
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
  
    devise_for :users, controllers: {registrations: "users/registrations", omniauth_callbacks: "callbacks"}
    
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
