Rails.application.routes.draw do
  root 'pages#example'
  get '/:page' => 'pages#show'
end
