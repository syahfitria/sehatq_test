Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, defaults: { format: :json }
  namespace :api, :defaults => { :format => 'json' } do
    namespace :v1 do
      resources :hospitals do
        collection do
          get :hospital_doctor
        end
      end
      resources :sessions
      resources :registrations
      resources :doctors
      resources :book_doctors
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htm
  root :to => "api/v1/registrations#index"
end
