Rails.application.routes.draw do
  root to: 'links#new'
  
  post 'create' => 'links#create'
  
  get '/:slug' => 'links#show'
end
