Rails.application.routes.draw do
  get "orders/new"
  get "orders/create"
  get "orders/show"
  get "carts/show"
  get "carts/add"
  get "carts/remove"
  root "home#index"
  namespace :public do
    get "menus/show"
  end
  namespace :admin do
    get "dashboard/index"
  end

  resources :menu_items, except: [ :index ]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

# Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
# get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
# get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

# admin dashboard
get "/admin", to: "admin/dashboard#index", as: "admin_dashboard"

# Sign up
get  "/signup", to: "restaurants#new", as: "signup"
post "/signup", to: "restaurants#create"
# Sign in or sign out
get    "/login",  to: "sessions#new", as: "login"
post   "/login",  to: "sessions#create"
delete "/logout", to: "sessions#destroy", as: "logout"
# guest menu page route
get "/menu/:slug", to: "public/menus#show", as: "menu"

# carts
get "/cart", to: "carts#show", as: "cart"
post "/cart/add/:menu_item_id", to: "carts#add", as: "add_to_cart"
delete "/cart/remove/:menu_item_id", to: "carts#remove", as: "remove_from_cart"

# orders
resources :orders, only: [ :new, :create, :show ]
end
