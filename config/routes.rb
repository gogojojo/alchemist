Rails.application.routes.draw do
  get '/' => 'application#index', as: :home
  get '/results' => 'application#results', as: :results
  post '/' => 'application#score'
end


  
