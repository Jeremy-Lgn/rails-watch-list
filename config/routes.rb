Rails.application.routes.draw do
  root to: "lists#index"

  resources :lists, only: %i[index new show create] do
    resources :bookmarks, only: %i[create]
  end
  resources :bookmarks, only: %i[destroy]
end
