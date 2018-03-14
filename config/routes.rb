Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  get "doctors/search"

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  root "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :doctors
  resources :mothers do
    resources :children do
      resources :milestones, except: :show
    end
  end

  resources :chatrooms, except: [:create, :edit] do
    resources :comments, except: [:delete, :update, :edit]
  end

  get "/doctors/:id/homepage" => "doctors#homepage", as: "doctor_profile"
  post '/doctor/:doctor_id/children/:child_id' => "chatrooms#create", as:"create_chatroom"
  get 'payment/:chatroom_id/new' => "payments#new", as:"new_payment"
  post 'payment/:chatroom_id/checkout' => "payments#checkout", as: "check_out"

  mount ActionCable.server, at: '/cable'

end
