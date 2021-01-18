Rails.application.routes.draw do
  root to: "sessions#new"

  resources :sessions, only: [:new, :create] do
  	delete :destroy, on: :collection # "on: :collection"、idを伴わないパスを追加するときに使う。逆に、idを伴うパスを追加する場合は"on: :member"を使う。
  end

  resources :dashboard, only: [:index]
  resources :insights, only: [:index]
  resources :expenses, only: [:index]
  resources :expense_uploads, only: [:new, :create]

  namespace :api do　# "namespace"、コントローラをグループ化できる。　例：ユーザーが使う部分と管理者が使う部分、それぞれで分けて管理できるようにする。
  	namespace :vi do
  		resources :expenses, only: [:index, :create, :destroy, :update]
  		resources :categories, only: [:index, :create, :update, :destroy]
  		resources :reports do
  			get :year, on: :collection
  			get :month, on: :collection
  		end

  		resources :goals, only: [:index] do
  			put :update, on: :collection #patch/put
  		end
  	end
  end

  get "/404", to: "errors#not_found"
  get "/422", to: "errors#not_found"
  get "/500", to: "errors#not_found"
end
