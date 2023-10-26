Rails.application.routes.draw do
 
  
  namespace :public do
    get 'cart_items/index'
  end
      # 顧客用
# URL /customers/sign_in ...
devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
 # 管理者用
# URL /admin/sign_in ...
devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  scope module: :public do
   root to: 'homes#top' 
   get '/about' => 'homes#about'
   get '/customers/mypage' => 'customers#show'
   get '/customers/information/edit' => 'customers#edit'
   delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
   get '/orders/confirm' => 'orders#confirm'
   get '/orders/thanks' => 'orders#thanks' 
   get '/customers/check' => 'customers#check'
   patch '/customers/withdrawa' => 'customers#withdraw' 
   
   resources :orders, only:[:new, :index, :show, :create,]
   resources :cart_items, only:[:index, :update, :create, :destroy]
   resources :customers, only: [:show, :edit, :update,]
   resources :items, only: [:index, :show, ]
   
   #collection do
    #  get 'confirm_withdraw'
     # patch 'withdraw'
   #end
   end
  
  namespace :admin do
   root to: 'homes#top' 
   get '/orders/:id' => 'orders#show'
   resources:items, only: [:create, :update, :index, :show, :edit, :new,]
   resources:customers, only: [:index, :show, :edit, :update]
   
  
   
  end
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
   end
