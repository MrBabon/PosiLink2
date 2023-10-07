Rails.application.routes.draw do
  root to: "pages#home"
  
  ############# DEVISE ############
  devise_for :users
  #################################
  ############# ADMIN #############
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  ############ BLAZER #############
  # authenticate :user, ->(user) { user.admin? } do  ##### PAS SÛR DE LE METTRE #####
  #   mount Blazer::Engine, at: "blazer"
  # end
  #################################
  ############# USER ##############
  resources :users, only: [:show, :edit, :update] do
    get 'my_events', on: :member
  end
  #################################
  ######### ORGANIZATION ##########
  resources :organizations do
    resources :events, only: [:index, :show]
    # member do
    #   post 'follow'           #### FOLLOW EN COURS ####
    #   delete 'unfollow'
    # end  
  end
  #################################
  ############ EVENT ##############
  resources :events, except: [:destroy] do
    resources :participations, only: [:destroy]
  end
  resources :participations, only: [:create]
  #################################
  ########### CHATROOM ############
  # resources :chatrooms, only: [:show, :index] do
  #   resources :messages, only: :create
  #   collection do
  #     get :new_private_conversation
  #     post :create_private_conversation
  #   end
  # end
  # get 'chatrooms/:id/chatroom_partial', to: 'chatrooms#chatroom_partial', as: 'chatroom_partial'
  #################################
end