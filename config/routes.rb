Rails.application.routes.draw do
  

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  post "doctors/search" => "doctors#search"


  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  post "/guest" => "sessions#guest", as: "guest"
  post "/chat" => "welcome#chat", as: "chat"
  root "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :doctors
  resources :mothers do
    resources :children do
      resources :milestones, except: :show, :path => "/"
    end
  end

  resources :chatrooms, except: [:create, :edit] do
    resources :comments, except: [:delete, :update, :edit]
  end

  get "/doctors/:id/homepage" => "doctors#homepage", as: "doctor_profile"
  get "/mothers/:id/homepage" => "mothers#homepage", as: "mother_profile"
  get "/subscribe" => "mothers#subscribe", as: "subscribe"


  get "/mothers/:id/reservations" => "reservations#index", as: "mothers_reservations"
  post '/chatrooms/:id/reservation' =>"reservations#create", as: "reserve"
  delete "/mothers/:mother_id/reservations/:id" => "reservations#destroy", as: "delete_mothers_reservations"
  patch "/reservations" => "reservations#update", as: "update_reservation"

  resources :timeslots
  post '/chatrooms/:chatroom_id/search' =>"chatrooms#search", as: "timeslots_search"


  post '/doctor/:doctor_id/chatrooms' => "chatrooms#create", as:"create_chatroom"
  get 'braintree/new' => "braintree#new"
  post 'braintree/checkout' => "braintree#checkout", as: "check_out"

  mount ActionCable.server, at: '/cable'

end
