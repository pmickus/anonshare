Rails.application.routes.draw do
  root "folders#index"
  resources :folders, param: :token do
    resources :contents do
      resources :comments
    end
  end
  get "/folders/:token/carousel", to: "folders#carousel"
  get "/folders/:token/download_all", to: "folders#download_all"
end
