Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :pictures, only: %i[index create update]
    end
  end
end
