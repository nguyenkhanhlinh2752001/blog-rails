Rails.application.routes.draw do
    root "articles#index"
    
    # get "/articles", to: "articles#index"
    # get "/articles/:id", to: "articles#show"
    # post "/articles", to: "articles#create"
    resources :articles do
        resources :comments
    end
end
