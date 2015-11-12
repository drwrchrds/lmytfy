Rails.application.routes.draw do
  root to: 'static_pages#root'
  
  post 'create' => 'static_pages#create_link'
  
  get '/:slug' => 'static_pages#show_link'
end
