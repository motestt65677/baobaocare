Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :doctors, except: [:create, :new]
  resources :mothers, except: [:create, :new] do
    resources :children do
      resources :milestones, except: :show
    end
  end

  resources :chatrooms, except: [:create, :edit] do
    resources :comments, except: [:delete, :update, :edit]
  end

  post '/doctor/doctor_id/children/child_id' => "chatrooms#create", as:"create_chatroom"
  get 'payment/:chatroom_id/new' => "payments#new", as:"new_payment"
  post 'payment/:chatroom_id/checkout' => "payments#checkout", as: "check_out"
end
