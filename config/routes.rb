Rails.application.routes.draw do
  scope format: false do
    namespace :api do
      namespace :v1 do
        resource :session, only: %i[show create destroy]
        resources :events, only: %i[index create]
      end
    end
  end
end
